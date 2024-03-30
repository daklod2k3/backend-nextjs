import { prisma } from '@/app/api/v1/helper.js';
import bcrypt from 'bcrypt';
import { NextResponse } from 'next/server';

export async function POST(req){
    const {username, password} = await req.json()
    if (!username || !password)
        return NextResponse.json("Invalid username or password")
    const unique = await prisma.uSER.findFirst({
        where: {
            username: username
        }
    })

    if (unique)
        return NextResponse.json({ message: "Username already exist"}, {status: 400})

    try {
        const hash = await bcrypt.hash(password, Number(process.env.saltRound))
    
        const user = await prisma.uSER.create({
            data: {
                username: username,
                password: hash
            }
        })

        return NextResponse.json({
            message: true
        }, { status: 200 })
        
    }catch (e){
        console.log(e);
        return NextResponse.json(e)
    }
    
}