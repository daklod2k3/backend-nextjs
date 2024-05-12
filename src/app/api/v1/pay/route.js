import { NextResponse } from "next/server";
import { unauthorizeResponse, validToken } from "../(auth)/_lib/authToken";
import { prisma, QueryConvert } from "../helper";


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

    // const carts = await req.json()
    // console.log(carts);

    // if (!carts || Array.from(carts).length < 1){
    //     return invalidCart()
    // }
    try {
        const invoice = await prisma.iNVOICE.findFirst({
            where: {
                user_id: user.user_id,
                status_id: 4
            }
        })

        if (!invoice)
            throw new Error("Nothing in cart")

        const details = await prisma.iNVOICE_DETAIL.findMany({
            where: {
                invoice_id: invoice.invoice_id
            }
        })

        details.forEach(async (detail)=>{
            const product = await prisma.pRODUCT.findFirst({
                where: {
                    product_id: detail.product_id
                }
            })
            if (product.amount < detail.amount)
                throw new Error("Amount not enough")
            const update = await prisma.pRODUCT.update({
                where:{
                    product_id: product.product_id,
                },
                data: {
                    amount: product.amount - detail.amount
                }
            })
        })

        await prisma.iNVOICE.update({
            where: {
                user_id: user.user_id,
                invoice_id: invoice.invoice_id
            },
            data:{
                status_id: 1
            }
        })
        
        return NextResponse.json({},{
            status: 200
        })

    }catch (e){
        return NextResponse.json({
            message: e.message
        }, {
            status: 400
        })
    }
    
}

export async function GET (req){
    const url = new URL(await req.url)
    const {searchParams} = url

    const filter = searchParams.getAll("filter")
                                .map(item=>{
                                    const param = QueryConvert(item)
                                    console.log(param.key);
                                    switch (param.key){
                                        case "invoice_id":
                                        case "employee_id":
                                        case "user_id":
                                        case "status_id":
                                            param.value = Number(param.value)
                                            return param                                            

                                    }
                                    return null
                                })
                                .reduce((rec, item)=> {
                                    if (!item) return rec
                                    return {
                                        ...rec,
                                        ...QueryToPrismaSearch(item)
                                    }
                                }, {})
    console.log(filter);
}