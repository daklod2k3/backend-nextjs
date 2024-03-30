import { prisma, QueryConvert, QueryToPrismaSearch } from '@/app/api/v1/helper';
import { NextResponse } from 'next/server';
// export async function POST(req){

// }

export async function GET(req){
    const url = new URL(await req.url)
    const {searchParams} = url

    const filter = searchParams.getAll("filter")
                                .map(item=>{
                                    const param = QueryConvert(item)
                                    console.log(param.key);
                                    switch (param.key){
                                        case "amount":
                                        case "category_id":
                                        case "price":
                                        case "vendor_id":
                                            param.value = Number(param.value)
                                        case "name":
                                        case "img_url":
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

    const finalFilter = {
        // vendor_id: filter.vendor_id
    }

    try {
        const categories = await prisma.pRODUCT.findMany({
            where: {
                ...filter
            }
        })
        return NextResponse.json(categories)
    } catch (e) {
        console.log(e);
        return NextResponse.json(e, {
            status: 400
        })
    } finally {
        prisma.$disconnect()
    }
}

export async function POST(req){
    const {
        vendor_id,
        name,
        price,
        img_url,
        amount,
        category_id,
    } = await req.json()
    
    try {
        const product = await prisma.pRODUCT.create({
            data: {
                // ["vendor_id"]: Number(vendor_id),
                name: name,
                price: Number(price),
                img_url: img_url,
                amount: amount? Number(amount): 0,
                VENDOR: {
                    connect: {
                        vendor_id: Number(vendor_id)
                    }
                },
                CATEGORY: {
                    connect: {
                        category_id: Number(category_id)
                    }
                }
            }
        })
        return NextResponse.json(product)
    }catch (e){
        console.log(e);
        return NextResponse.json(e, {status: 400})
    }finally{
        prisma.$disconnect()
    }
}