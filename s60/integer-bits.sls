#!r6rs
(library (srfi s60 integer-bits)
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
  (import
    (srfi s16)
    (rnrs base)
    (rnrs control)
    (rnrs arithmetic bitwise))

  (define logand bitwise-and)
  (define logior bitwise-ior)
  (define logxor bitwise-xor)
  (define lognot bitwise-not)
  (define bitwise-merge bitwise-if)

  (define (logtest n1 n2)
    (not (zero? (bitwise-and n1 n2))))
  
  (define any-bits-set? logtest)

  (define (bitwise-count n)
    (if (negative? n)
        (bitwise-bit-count (bitwise-not n))
        (bitwise-bit-count n)))

  (define logcount bitwise-count)
  (define integer-length bitwise-length)
  (define first-set-bit bitwise-first-bit-set)
  (define log2-binary-factors bitwise-first-bit-set)
  (define bit-set? bitwise-bit-set?)
  (define logbit? bitwise-bit-set?)
  (define copy-bit bitwise-copy-bit)
  (define bit-field bitwise-bit-field)
  (define copy-bit-field bitwise-copy-bit-field)
  (define ash bitwise-arithmetic-shift)
  (define arithmetic-shift bitwise-arithmetic-shift)
  (define rotate-bit-field bitwise-rotate-bit-field)
  (define reverse-bit-field bitwise-reverse-bit-field)

  (define integer->list
    (case-lambda
      ((k) (do ((k k (arithmetic-shift k -1))
                (lst '() (cons (odd? k) lst)))
               ((<= k 0) lst)))
      ((k len) (do ((idx (+ -1 len) (+ -1 idx))
                    (k k (arithmetic-shift k -1))
                    (lst '() (cons (odd? k) lst)))
                   ((negative? idx) lst)))))
  
  (define (list->integer bools)
    (do ((bs bools (cdr bs))
         (acc 0 (+ acc acc (if (car bs) 1 0))))
        ((null? bs) acc)))
  
  (define (booleans->integer . bools)
    (list->integer bools)))
