import { prisma } from '@/app/api/v1/helper.js';
import bcrypt from 'bcrypt';
import { NextResponse } from 'next/server';
import { getToken } from '../_lib/authToken';

export async function POST(req){

    const {username, password} = await req.json()

    const account = await prisma.uSER.findFirst({
        where: {
            username: username
        }
    })

    if (!account){
        return NextResponse.json({
            message: "Username or password invalid!"
        }).status(400)
    }
    
    


    if (!await bcrypt.compare(password, account.password)){
        return NextResponse.json({
            message: 'Username or password invalid!'
        }, {
            status: 400
        })
    }
    
        // console.log(user);
    let user = null;
    switch (account.role_id){
        case 2:
            user = await prisma.eMPLOYEE.findFirst({
                where: {
                    user_id: account.user_id
                }
            })
            break
        case 3:
            user = await prisma.cUSTOMER.findFirst({
                where: {
                    user_id: account.user_id
                }
            })
            break
    }

    console.log(user);

    return NextResponse.json({
        ...user
    }, {
        headers:{
            Authorization: getToken(user)
        },
        status: 200
    })
        
    

}