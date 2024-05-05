import { NextResponse } from "next/server";
import { unauthorizeResponse, validToken } from "../(auth)/_lib/authToken";
import { prisma } from "../helper";


function invalidCart(){
    return NextResponse({
        message: "Carts not valid"
    }, {
        status: 400
    })
}

function productAmountError(){
    return NextResponse({
        message: "Product amount not enough"
    }, {
        status: 400
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

    for (const cart in Array.from(carts)){
        if (!cart.product_id || !cart.amount)
            return invalidCart()

        const product = await prisma.pRODUCT.findFirst({
            where: {
                product_id: cart.product_id
            }
        })

        if (product.amount < cart.amount)




    }


    
    return NextResponse.json({})
    
}