import { validToken } from '@/app/api/v1/(auth)/_lib/authToken.js';
import { headers } from 'next/headers';
import { NextResponse } from 'next/server';
import { unauthorizeResponse } from './app/api/v1/(auth)/_lib/authToken';

export async function middleware(request) {
  const headerList = headers()
  const token = headerList.get('authorization')
  // console.log(headerList);

  // web app only
  // if (validToken(token) && request.nextUrl.pathname.match(/\/(login|register)$/g)) {
  //   return NextResponse.redirect(new URL('/', request.url));
  // }

  if (
    request.nextUrl.pathname.match(
      /\/(?!login|register|\_next\/image|static)\w+$/g
    ) ||
    request.nextUrl.pathname === '/'
  ) {
    if (!token) {
      return unauthorizeResponse()
      
    }
  }
  return NextResponse.next();
}
