import { PrismaClient } from "@prisma/client";
import bcrypt from 'bcrypt';
import { NextResponse } from 'next/server';

export async function POST(req){
    const {username, password} = await req.json()
    console.log(username, password);
    if (!username || !password)
        return NextResponse.json("Invalid username or password")

    const prisma = new PrismaClient()
    const unique = await prisma.uSER.findMany({
        where: {
            username: username
        }
    })

    if (unique)
        return NextResponse.json("Username already exist")

    try {
        const hash = await bcrypt.hash(password, String(process.env.saltRound))
    
        const user = prisma.uSER.create({
            username: username,
            password: hash
        })

        return NextResponse.json(user)
        
    }catch (e){
        console.log(e);
        return NextResponse.json(e)
    }
    
}