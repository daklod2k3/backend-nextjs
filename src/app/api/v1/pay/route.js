import { NextResponse } from "next/server";
import { unauthorizeResponse, validToken } from "../(auth)/_lib/authToken";
import { prisma } from "../helper";


function invalidCart(){
    return NextResponse.json({
        message: "Carts not valid"
    }, {
        status: 400
    })
}

function productAmountError(){
    return NextResponse.json({
        message: "Product amount not enough"
    }, {
        status: 400
    })
}

async function payCart(carts, user){
    try{
        const invoice = await prisma.iNVOICE.create({
            data:{
                USER: {
                    connect:{
                        user_id: user.user_id
                    }
                }, 
                INVOICE_STATUS: {
                    connect: {
                        invoice_status_id: 1
                    }
                }
            }
        })

        await prisma.iNVOICE_DETAIL.deleteMany({
            where: {
                invoice_id: null,
                user_id: user.user_id
            }
        })

        Array.from(carts).forEach(async (cart)=>{
            console.log(cart);
            try {
                Number(cart.product_id)
                Number(cart.amount)
            }catch {
                return NextResponse.json({
                    "message": "Invalid product_id or amount"
                }, {
                    status: 400
                })
            }

    
            const product = await prisma.pRODUCT.findFirst({
                where: {
                    product_id: Number(cart.product_id)
                }
            })
    
            if (product.amount < cart.amount)
                return productAmountError()
            
            await prisma.iNVOICE_DETAIL.create({
                data: {
                    USER: {
                        connect: {
                            user_id: user.user_id
                        }
                    },
                    INVOICE: {
                        connect: {
                            invoice_id: invoice.invoice_id
                        }
                    },
                    PRODUCT: {
                        connect: {
                            product_id: product.product_id
                        }
                    },
                    amount: Number(cart.amount),
                }
            })

            await prisma.pRODUCT.update({
                where: {
                    product_id: Number(cart.product_id)
                },
                data: {
                    amount: product.amount - Number(cart.amount)
                }
            })
        })
            
        return NextResponse.json({}, {
            status: 200
        })
    }
    catch {
        return NextResponse.json({},{
            status: 400
        })
    }
    
}

export async function POST (req){
    const user = await validToken()
    if (!user) 
        return unauthorizeResponse()

    const carts = await req.json()
    console.log(carts);

    if (!carts || Array.from(carts).length < 1){
        return invalidCart()
    }

    // if (payCart(carts, user)){
    //     return NextResponse.json({}, {
    //         status: 200
    //     })
    // }
    
    // return NextResponse.json({},{
    //     status: 400
    // })
    return await payCart(carts, user)

    
}