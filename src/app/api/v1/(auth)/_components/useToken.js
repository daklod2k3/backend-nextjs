import jwt from 'jsonwebtoken';
import { prisma } from '../../helper';

const key = String(process.env.JWT_SECRET_KEY)

export const useToken = (user_id)=>{
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

export const validToken = (token)=>{
    try {
        const verified = jwt.verify(token, key)
        if (!verified) return false
        const user = prisma.uSER.findFirst({
            where: {
                user_id: verified.user_id
            }
        })
        return user == null
    }catch (e){
        return e.message
    }

}