import { prisma } from '@/app/api/v1/helper.js';
import bcrypt from 'bcrypt';
import { NextResponse } from 'next/server';
import { getToken } from '../_lib/authToken';

export async function POST(req){
    const {username, password, name, phone} = await req.json()
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

        const [user, customer] = await prisma.$transaction([
            prisma.uSER.create({
                data: {
                    username: username,
                    password: hash,
                    ROLE: {
                        connect: {
                            role_id: 3
                        }
                    }
                }
            }),
            prisma.cUSTOMER.create({
                data: {
                    name: name,
                    phone: phone,
                }
            })
        ])
        
        const result = await prisma.cUSTOMER.update({
            data: {
                USER: {
                    connect: {
                        user_id: user.user_id
                    }
                }
            },
            where: {
                customer_id: customer.customer_id
            }
        })
    
        return NextResponse.json({
            ...result
        }, { 
            status: 200,
            headers: {
                Authorization: getToken(result)
            }
        })
    }catch (e){
        console.log(e);
        return NextResponse.json(e, {status: 400})
    }
    
}