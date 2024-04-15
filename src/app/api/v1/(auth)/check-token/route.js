import { headers } from 'next/headers';
import { NextResponse } from 'next/server';
import { validToken } from '../_components/authToken';


export async function POST(req){
    const headerList = headers()
    const token = headerList.get('authorization')
    // console.log(token);
    if (validToken(token))
        return NextResponse.json({},{
            status: 200
        })
    return NextResponse.json({
        // "message": 
    }, {
        status: 400
    })
}