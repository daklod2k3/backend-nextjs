import { headers } from 'next/headers';
import { NextResponse } from 'next/server';
import { validToken } from '../_lib/authToken';


export async function GET(req){
    const headerList = headers()
    const token = headerList.get('authorization')
    console.log(token);
    if (await validToken(token))
        return NextResponse.json({},{
            status: 200
        })
    return NextResponse.json({
        // "message": 
    }, {
        status: 401
    })
}