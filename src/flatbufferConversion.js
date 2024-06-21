// @ts-ignore
import * as flatbuffers from 'flatbuffers';
import { Buffer } from 'buffer';

export const writeFB = (standard) => {
    if (!standard?.pack) {
        console.log(standard);
        throw new Error("INVALID DATA TO BE PACKED");
    }
    const flatBufferBuilder = new flatbuffers.Builder(1);
    let packed = standard.pack(flatBufferBuilder);
    flatBufferBuilder.finish(packed);
    return Buffer.from(flatBufferBuilder.asUint8Array());
}

export const readFB = (fbs, tableName, parentClass) => {
    const bufferLength = fbs.readUInt32LE(0);
    const fileIdentifier = Buffer.from(fbs.slice(4, 8)).toString();

    console.log(`Buffer Length: ${bufferLength}`);
    console.log(`File Identifier: ${fileIdentifier}`);
    let input = new parentClass[`${tableName}COLLECTIONT`]();
    parentClass[`${tableName}COLLECTION`][`getRootAs${tableName}COLLECTION`](
        new flatbuffers.ByteBuffer(fbs)).unpackTo(input);
    return input;
}

export const getFileName = (standard, CID) => `${CID}.${standard?.toLowerCase()}.fbs`;
