import { prisma } from '@/app/api/v1/helper.js';
import { NextResponse } from 'next/server';

// export async function POST(req){

// }

export async function GET(req){
    try {
        const categorys = await prisma.cATEGORY.findMany()
        return NextResponse.json(categorys)
    } catch (e) {
        return NextResponse.json(e, {
            status: 400
        })
    }
}