
import { NextResponse } from "next/server";
import { unauthorizeResponse, validToken } from "../(auth)/_lib/authToken";
import { prisma } from "../helper";

// async function getUser(req){
//     const headerList = headers()
//     const url = new URL(await req.url)
//     // console.log(url);
//     const getMe = await fetch(url.origin + '/api/v1/me', {
//         method: 'GET',
//         headers: {
//             'authorization': headerList.get('authorization')
//         }
//     })
//     // console.log(await user.json());
//     if (getMe.status != 200) 
//         return NextResponse.json({}, {
//             status: getMe.status
//         })

//     const user_id = await getMe.json().user_id

//     if (user_id) 
//         return NextResponse.json({}, {
//             status: 401
//         })
// }

export async function GET(req){
    
    // const user_id = await getUser(req)
    // if (user_id instanceof NextResponse)
    //     return user_id

    // const cart = await prisma.iNVOICE_DETAIL.findFirst({
    //     where:{
    //         user_id: user_id
    //     }
    // })
    
    // return NextResponse.json({
    //     ...cart
    // })
    
    const verified = await validToken()

    if (!verified){
        return unauthorizeResponse()
    }

    const invoice = await prisma.iNVOICE.findFirst({
        where: {
            status_id: 4,
            user_id: verified.user_id
        }
    })

    let carts = []
    if (invoice)
        carts = await prisma.iNVOICE_DETAIL.findMany({
            where: {
                invoice_id: invoice.invoice_id,
                user_id: verified.user_id
            }
        })
    
    const product_list = []
    for (let i = 0; i < carts.length; i++){
        const product = await prisma.pRODUCT.findFirst({
            where: {
                product_id: carts[i].product_id
            }
        })
        product_list.push(product)
    }

    return NextResponse.json({
        productList: product_list,
        invoiceDetail: carts
    })

    
    
}

export async function POST(req){


    const verified = await validToken()
    if (!verified){
        return unauthorizeResponse()
    }

    const user = await prisma.uSER.findFirst({
        where: {
            user_id: verified.user_id
        }
    })

    const item = await req.json()
    if (!item.product_id){
        return NextResponse.json({
            message: "Missing product_id"
        },{
            status: 400
        })
    }

    if (!item.amount){
        return NextResponse.json({
            message: "Missing amount"
        },{
            status: 400
        })
    }

    const transaction = async (item)=>{
        return prisma.$transaction(async (tx)=>{
            const {
                product_id,
                // amount,
            } = item

            const amount = Number(item.amount)

            console.log(item);
        
        
            const product = await tx.pRODUCT.findFirst({
                where: {
                    product_id: Number(product_id)
                }
            })
        
            if (!product)
                return NextResponse.json({
                    message: 'Product not found'
                },{
                    status: 400
                })
        
            let cart = await tx.iNVOICE.findFirst({
                where: {
                    user_id: user.user_id,
                    status_id: 4
                },
            })

            if (!cart){
                cart = await tx.iNVOICE.create({
                    data: {
                        USER: {
                            connect: {
                                user_id: user.user_id
                            }
                        },
                        INVOICE_STATUS: {
                            connect: {
                                status_id: 4
                            }
                        }
                    }
                })
            }

                
        
            const product_in_cart = await tx.iNVOICE_DETAIL.findFirst({
                where: {
                    product_id: product.product_id,
                    user_id: user.user_id,
                    invoice_id: cart.invoice_id
                }
            })
        
            const amount_in_cart = product_in_cart?.amount ?? 0
        
        
            
        
            if (amount + amount_in_cart > product.amount)
                return NextResponse.json({
                    message: 'Product mount higher than stored'
                }, {
                    status: 400
                })

            if (amount + amount_in_cart == 0){
                const result = await tx.iNVOICE_DETAIL.delete({
                    where: {
                        product_id_user_id_invoice_id :{
                            product_id: product_in_cart.product_id,
                            user_id: user.user_id,
                            invoice_id: cart.invoice_id                            
                        }
                    }
                })

                if (result)
                    return NextResponse.json({},{
                        status: 200
                    })

                return NextResponse.json({
                    message: "Can't delete product"
                },{
                    status: 400
                })
            }
            
            if (amount + amount_in_cart < 0)
                return NextResponse.json({
                    message: "Amount can't positive number"
                }, {
                    status: 400
                })
            
            if (product_in_cart){
                const rs = await tx.iNVOICE_DETAIL.update({
                    where: {
                        product_id_user_id_invoice_id: {
                            product_id: product.product_id,
                            user_id: user.user_id,
                            invoice_id: cart.invoice_id
                        }
                    },
                    data: {
                        amount: amount + amount_in_cart
                    }
                })

                if (!rs)
                    return NextResponse.json({},{
                        status: 400
                    })

            }else {
                const rs = await tx.iNVOICE_DETAIL.create({
                    data: {
                        INVOICE: {
                            connect: {
                                invoice_id: cart.invoice_id
                            }
                        },
                        PRODUCT: {
                            connect: {
                                product_id: product.product_id,
                            }
                        },
                        USER: {
                            connect: {
                                user_id: Number(user.user_id)
                            }
                        },
                        amount: amount
                    }
                })
                if (!rs)
                    return NextResponse.json({}, {
                        status: 400
                    })
            }
            
            // if (!cart)
            //     return NextResponse.json({
                    
            //     }, {
            //         status: 400
            //     })
            
            return NextResponse.json({},{
                status: 200
            })
            
        })
    }

    return transaction(item)

    
    

    
}