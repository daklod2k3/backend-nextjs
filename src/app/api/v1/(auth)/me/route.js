import { headers } from "next/headers";
import { NextResponse } from "next/server";
import { validToken } from '../_component/authToken';


export async function GET(){
    const headerList = headers()
    const token = headerList.get('authorization')
    const user = await validToken(token)
    console.log(user);
    if (user){
        return NextResponse.json({
            user_id: user.user_id,
        }, {
            status: 200
        })
    }

    return NextResponse.json({

    }, {
        status: 401
    })

}