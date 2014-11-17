package luxe.utils;

import haxe.io.Bytes;
import haxe.io.BytesInput;

/**
 * Pure Haxe MurmurHash version 3 (32 bit variant) implementation.
 *
 * @link https://en.wikipedia.org/wiki/MurmurHash
 * @link https://github.com/michelkaeser
 * @license MIT
 */
class Murmur3
{
    private static inline var C1:UInt = 0xcc9e2d51;
    private static inline var C2:UInt = 0x1b873593;
    private static inline var R1:Int  = 15;
    private static inline var R2:Int  = 13;
    private static inline var M:Int   = 5;
    private static inline var N:UInt  = 0xe6546b64;


    /**
     * Returns the hash value of the input bytes.
     *
     * @param haxe.io.Bytes bytes the bytes to get the hash for
     * @param UInt          seed  an optional seed value
     *
     * @return UInt the hash value
     */
    public static function hash(bytes:Bytes, seed:UInt = 0):UInt
    {
        var hash:UInt         = seed;
        var nblocks:Int       = Std.int(bytes.length / 4); // >>> 2?
        var blocks:BytesInput = new BytesInput(bytes);

        for (i in 0...nblocks) {
            var k:UInt = blocks.readInt32();
            k *= Murmur3.C1;
            k  = (k << Murmur3.R1) | (k >>> 17 /* (32 - Murmur3.R1) */);
            k *= Murmur3.C2;
            hash ^= k;
            hash  = (hash << Murmur3.R2) | (hash >>> 19 /* (32 - Murmur3.R2) */);
            hash  = hash * Murmur3.M + Murmur3.N;
        }

        var offset:Int = nblocks * 4; // << 2?
        var k1:UInt    = 0;
        switch (bytes.length % 4) {
            case 3: {
                k1 ^= bytes.get(offset + 2) << 16;
                k1 ^= bytes.get(offset + 1) << 8;
                k1 ^= bytes.get(offset);
                k1 *= Murmur3.C1;
                k1  = (k1 << Murmur3.R1) | (k1 >>> 17 /* (32 - Murmur3.R1) */);
                k1 *= Murmur3.C2;
                hash ^= k1;
            }
            case 2: {
                k1 ^= bytes.get(offset + 1) << 8;
                k1 ^= bytes.get(offset);
                k1 *= Murmur3.C1;
                k1  = (k1 << Murmur3.R1) | (k1 >>> 17 /* (32 - Murmur3.R1) */);
                k1 *= Murmur3.C2;
                hash ^= k1;
            }
            case 1: {
                k1 ^= bytes.get(offset);
                k1 *= Murmur3.C1;
                k1  = (k1 << Murmur3.R1) | (k1 >>> 17 /* (32 - Murmur3.R1) */);
                k1 *= Murmur3.C2;
                hash ^= k1;
            }
        }

        hash ^= bytes.length;
        hash ^= (hash >>> 16);
        hash *= 0x85ebca6b;
        hash ^= (hash >>> 13);
        hash *= 0xc2b2ae35;
        hash ^= (hash >>> 16);

        return hash;
    }
}
