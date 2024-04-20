import { prisma } from '@/app/api/v1/helper.js';
import bcrypt from 'bcrypt';
import { NextResponse } from 'next/server';
import { getToken } from '../_component/authToken';

export async function POST(req){

    const {username, password} = await req.json()

    const user = await prisma.uSER.findFirst({
        where: {
            username: username
        }
    })

    console.log(user);
    
    if (!user){
        return NextResponse.json({
            message: "Username or password invalid!"
        }).status(400)
    }
    if (await bcrypt.compare(password, user.password)){
        return NextResponse.json({
            message: true,
        }, {
            headers:{
                Authorization: getToken(user.user_id)
            },
            status: 200
        })
    }
    else 
        return NextResponse.json({
            message: false
        }, {
            status: 400
        })
    

}