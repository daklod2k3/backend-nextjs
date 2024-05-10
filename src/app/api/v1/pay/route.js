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
    return await prisma.$transaction(async (tx)=>{
        const invoice = await tx.iNVOICE.create({
            data:{
                USER: {
                    connect:{
                        user_id: user.user_id
                    }
                }, 
                INVOICE_STATUS: {
                    connect: {
                        invoice_status_id: 0
                    }
                }
            }
        })

        for (const cart in Array.from(carts)){
            
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

            if (!cart.product_id || !cart.amount)
                return invalidCart()
    
            const product = await tx.pRODUCT.findFirst({
                where: {
                    product_id: cart.product_id
                }
            })
    
            if (product.amount < cart.amount)
                return productAmountError()
            
            await tx.iNVOICE_DETAIL.update({
                where: {
                    product_id_user_id:{
                        user_id: user.user_id,
                        product_id: product.product_id
                    },
                    invoice_id: invoice.invoice_id
                }
            })

        }

        return NextResponse.json({}, {
            status: 200
        })
    })
}

export async function GET (req){
    const user = validToken()
    if (!user) 
        return unauthorizeResponse()

    const {carts} = req.json()

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
    return payCart(carts, user)
    
}