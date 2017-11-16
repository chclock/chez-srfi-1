(library (srfi s143 compat)
  (export fxabs fxsquare fxsqrt)
  (import (rnrs base) (only (chezscheme) fxabs fx*))

  (define (fxsquare x) (fx* x x))
  (define (fxsqrt x) (exact-integer-sqrt x)))
