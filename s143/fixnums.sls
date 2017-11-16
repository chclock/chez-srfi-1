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
          (rename (except (rnrs arithmetic fixnums) fxcopy-bit)
                  (fxbit-count r6rs:fxbit-count)
                  (fxbit-set? r6rs:fxbit-set?)
                  (fxdiv0 fxquotient)
                  (fxmod0 fxremainder)
                  (fxfirst-bit-set fxfirst-set-bit)
                  (fxreverse-bit-field fxbit-field-reverse))
          (srfi s143 compat))

  (define fx-width (fixnum-width))
  (define fx-greatest (greatest-fixnum))
  (define fx-least (least-fixnum))

  (define (fxneg x) (fx- x))

  (define (fxbit-count i)
    (if (fx>=? i 0)
      (r6rs:fxbit-count i)
      (r6rs:fxbit-count (fxnot i))))

  (define (fxcopy-bit index to bool)
    (if bool
        (fxior to (fxarithmetic-shift-left 1 index))
        (fxand to (fxnot (fxarithmetic-shift-left 1 index)))))

  (define (fxbit-set? index i)
    (r6rs:fxbit-set? i index))

  (define (fxbit-field-rotate i count start end)
    (if (fxnegative? count)
      (fxrotate-bit-field i start end (+ count (- start end)))
      (fxrotate-bit-field i start end count))))
