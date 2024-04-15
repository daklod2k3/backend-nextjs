import { headers } from 'next/headers';
import { NextResponse } from 'next/server';
import { validToken } from '../_components/useToken';


export async function POST(req){
    const headerList = headers()
    const token = headerList.get('authorization')
    // console.log(token);
    return NextResponse.json({
        mess: validToken(token)
    })
}