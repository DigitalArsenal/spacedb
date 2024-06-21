// @ts-ignore
import * as flatbuffers from 'flatbuffers';
import { Buffer } from 'buffer';
import * as standards from 'spacedatastandards.org/lib/js/index.js';

export const writeFB = (standard) => {
    if (!standard?.pack) {
        console.log(standard);
        throw new Error("INVALID DATA TO BE PACKED");
    }
    const flatBufferBuilder = new flatbuffers.Builder(1);
    let packed = standard.pack(flatBufferBuilder);
    const fileID = "$" + standard.constructor.name.slice(0, 3);
    flatBufferBuilder.finishSizePrefixed(packed, fileID);
    return Buffer.from(flatBufferBuilder.asUint8Array());
}

export const readFB = (fbs) => {
    const byteBuffer = new flatbuffers.ByteBuffer(fbs);
    const results = [];

    let offset = 0;
    while (offset < fbs.length) {
        // Read the size of the current buffer
        const bufferLength = byteBuffer.readUint32(offset);
        // Get the file identifier
        const fileIdentifier = String.fromCharCode.apply(null, byteBuffer.bytes().slice(offset + 8, offset + 12));
        const tableName = fileIdentifier.replace('$', '');

        //console.log(`Buffer Length: ${bufferLength}`);
        //console.log(`File Identifier: ${fileIdentifier}`);

        const parentClass = standards[tableName];
        if (!parentClass) {
            throw new Error(`Unknown table name: ${tableName}`);
        }

        // Get the root and unpack
        const tableClass = parentClass[tableName];
        if (tableClass) {
            const sizePrefixedRoot = tableClass[`getSizePrefixedRootAs${tableName}`](new flatbuffers.ByteBuffer(fbs.slice(offset)));
            const input = new parentClass[`${tableName}T`]();
            sizePrefixedRoot.unpackTo(input);
            results.push(input);
        } else {
            throw new Error(`Unknown buffer type for table name: ${tableName}`);
        }

        // Move to the next buffer
        offset += bufferLength + 4; // Add 4 bytes for the length prefix
    }

    return results;
}

export const getFileName = (standard, CID) => `${CID}.${standard?.toLowerCase()}.fbs`;
