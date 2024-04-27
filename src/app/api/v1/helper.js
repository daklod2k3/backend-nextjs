import { PrismaClient } from "@prisma/client";


const op_map_prisma = {
    "eq" : "equals",
    "ne" : "not",
    "lt": "lt",
    "le": "lte",
    "gt": "gt",
    "ge": "gte",
    "in": "in",
    "ni": "notIn",
    "sw": "startsWith",
    "ew": "endsWith",
    "cn": "contains"
}

export const QueryConvert = (value)=>{
    const rs = String(value).split(":")
        return {
            key: rs[0],
            op: op_map_prisma[rs[1]],
            value: rs[2],
        }
}

export const QueryToPrismaSearch = (value)=>{
    return {
        [value.key]: {
            [value.op]: value.value
        }
    }
}


const prismaClientSingleton = () => {
  return new PrismaClient()
}

// export const prisma = globalThis.prismaGlobal ?? prismaClientSingleton()
export const prisma = new PrismaClient()

if (process.env.NODE_ENV !== 'production') globalThis.prismaGlobal = prisma