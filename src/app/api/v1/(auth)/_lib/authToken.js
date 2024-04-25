import jwt from 'jsonwebtoken';
import { headers } from 'next/headers';
import { NextResponse } from 'next/server';
import { prisma } from '../../helper';

const key = String(process.env.JWT_SECRET_KEY)

export const getToken = (info)=>{
    const expire = null
    // console.log(key);
    if (!info)
        return null
    const token = jwt.sign({
        ...info,
        ...expire,
        time: Date()
    }, key)
    return token
}

export const validToken = async ()=>{

    const headerList = headers()
    const token = headerList.get('authorization')

    console.log(token);

    try {
        const verified = jwt.verify(token, key)
        // console.log(verified);
        if (!verified) return false
        const user = await prisma.uSER.findFirst({
            where: {
                user_id: verified.user_id
            }
        })
        return verified ?? false
    }catch (e){
        console.log(e.message);
        return false
    }

}

export const unauthorizeResponse = ()=>{
    return NextResponse.json({
        message: "Unauthorize"
    }, {
        status: 401
    })
}