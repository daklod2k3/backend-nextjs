import { NextResponse } from 'next/server.js'
import { prisma } from '../helper.js'

export async function GET(){
    const banner = await prisma.bANNER.findMany()

    if (!banner)
        return NextResponse.json({},{
            status: 400
        })

    return NextResponse.json(banner, {
        status: 200
    })
}