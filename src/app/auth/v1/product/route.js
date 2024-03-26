import { prisma, QueryConvert, QueryToPrismaSearch } from '@/app/auth/v1/helper';
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
                                        case "vendor_id":
                                            param.value = Number(param.value)
                                            return param
                                        // case 

                                    }
                                    return param
                                })
                                .reduce((rec, item)=> {
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
                // filter
            }
        })
        return NextResponse.json(categories)
    } catch (e) {
        console.log(e);
        return NextResponse.json(e, {
            status: 400
        })
    }
}