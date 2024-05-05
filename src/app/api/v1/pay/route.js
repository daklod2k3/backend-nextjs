import { NextResponse } from "next/server";
import { unauthorizeResponse, validToken } from "../(auth)/_lib/authToken";

export async function GET (){
    const user = validToken()
    if (!user) 
        return unauthorizeResponse()

    
    return NextResponse.json({})
    
}