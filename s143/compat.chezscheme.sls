(library (srfi s143 compat)
  (export fxabs fxsquare fxsqrt)
  (import (rnrs base) (chezscheme))

  (define (fxsquare x) (fx* x x))
  (define (fxsqrt x) (exact-integer-sqrt x)))
