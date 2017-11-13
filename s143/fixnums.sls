(library (srfi s143 fixnums)
  (export fx-width fx-greatest fx-least
          
          fixnum?
          fx=? fx<? fx>? fx<=? fx>=?
          fxzero? fxpositive? fxnegative?
          fxodd? fxeven?
          fxmax fxmin

          fx+ fx- fxneg
          fx* fxquotient fxremainder
          fxabs fxsquare fxsqrt

          fx+/carry fx-/carry fx*/carry

          fxnot fxand fxior fxxor
          fxarithmetic-shift
          fxarithmetic-shift-left
          fxarithmetic-shift-right
          fxbit-count fxlength
          fxif fxbit-set?
          fxcopy-bit
          fxfirst-set-bit
          fxbit-field
          fxbit-field-rotate
          fxbit-field-reverse)
  
  (import (rnrs base)
          (rename (rnrs arithmetic fixnums)
                  (fxdiv0 fxquotient)
                  (fxmod0 fxremainder)
                  (fxfirst-bit-set fxfirst-set-bit)
                  (fxreverse-bit-field fxbit-field-reverse))
          (srfi s143 compat))

  (define fx-width (fixnum-width))
  (define fx-greatest (greatest-fixnum))
  (define fx-least (least-fixnum))

  (define (fxneg x) (fx- x))
  (define (fxbit-field-rotate i count start end)
    (fxrotate-bit-field i start end count))
  )
