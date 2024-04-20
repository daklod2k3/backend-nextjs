import jwt from 'jsonwebtoken';
import { headers } from 'next/headers';
import { prisma } from '../../helper';

const key = String(process.env.JWT_SECRET_KEY)

export const getToken = (user_id)=>{
    const expire = null
    // console.log(key);
    if (!user_id)
        return null
    const token = jwt.sign({
        user_id: user_id,
        ...expire,
        time: Date()
    }, key)
    return token
}

export const validToken = async (token)=>{
    try {
        const verified = jwt.verify(token, key)
        console.log(verified);
        if (!verified) return false
        const user = await prisma.uSER.findFirst({
            where: {
                user_id: verified.user_id
            }
        })
        return user ?? false
    }catch (e){
        console.log(e.message);
        return false
    }

}