#!r6rs
(library (srfi s60)
  (export logand bitwise-and
          logior bitwise-ior
          logxor bitwise-xor
          lognot bitwise-not
          bitwise-if bitwise-merge
          logtest any-bits-set?
          logcount bitwise-count
          integer-length
          log2-binary-factors first-set-bit
          logbit? bit-set?
          copy-bit
          bit-field
          copy-bit-field
          ash arithmetic-shift
          rotate-bit-field
          reverse-bit-field
          integer->list
          list->integer
          booleans->integer)
  (import (srfi s60 integer-bits))
)
