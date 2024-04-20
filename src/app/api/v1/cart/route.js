// import { NextResponse } from "next/server";
import { headers } from "next/headers";
import { NextResponse } from "next/server";
import { prisma } from "../helper";

async function getUser(req){
    const headerList = headers()
    const url = new URL(await req.url)
    // console.log(url);
    const getMe = await fetch(url.origin + '/api/v1/me', {
        method: 'GET',
        headers: {
            'authorization': headerList.get('authorization')
        }
    })
    // console.log(await user.json());
    if (getMe.status != 200) 
        return NextResponse.json({}, {
            status: getMe.status
        })

    const user_id = await getMe.json().user_id

    if (user_id) 
        return NextResponse.json({}, {
            status: 401
        })
}

export async function GET(req){
    
    const user_id = await getUser(req)
    if (user_id instanceof NextResponse)
        return user_id

    const cart = await prisma.iNVOICE_DETAIL.findFirst({
        where:{
            user_id: user_id
        }
    })
    
    return NextResponse.json({
        ...cart
    })
    

    
    
}

export async function POST(req){

    const user_id = await getUser(req)
    if (user_id instanceof NextResponse)
        return user_id

    const {
        product_id,
        amount,

    } = await req.json()


    const product = await prisma.pRODUCT.findFirst({
        where: {
            product_id: product_id
        }
    })

    if (!product)
        return NextResponse.json({
            message: 'Product not found'
        },{
            status: 400
        })

    const cart = await prisma.iNVOICE_DETAIL.upsert({
        where: {
            product_id: product_id,
            user_id: user_id,
            INVOICE: null
        },
        create: {
            product_id: product_id,
            user_id: user_id
        }
    })

    if (amount > product.amount)
        return NextResponse.json({
            message: 'Product mount higher than stored'
        }, {
            status: 400
        })

    if (cart)
        return NextResponse.json({ 
            message: 'Add success'
        })
    
}