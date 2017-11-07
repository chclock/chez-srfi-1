#!r6rs
;; Copyright 2010 Derick Eddington.  My MIT-style license is in the file named
;; LICENSE from the original collection this file is distributed with.

(library (srfi s78 lightweight-testing)
  (export
    check
    check-ec
    check-report
    check-set-mode!
    check-reset!
    check-passed?)
  (import
    (rnrs)
    (srfi s78 lightweight-testing compat)
    (srfi s39 parameters)
    (srfi s42 eager-comprehensions)
    (srfi s23 error tricks)
    (for (srfi private vanish) expand)
    (srfi private include))

  (define-syntax check:mode
    (identifier-syntax
      (_ (check:mode-param))
      ((set! _ expr) (check:mode-param expr))))

  (define check:mode-param (make-parameter #F))

  (let-syntax ((define (vanish-define define (check:write check:mode))))
    (SRFI-23-error->R6RS "(library (srfi s78 lightweight-testing))"
     (include/resolve ("srfi" "s78") "check.scm")))
)
