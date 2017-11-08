#!r6rs
;; Copyright 2010 Derick Eddington.  My MIT-style license is in the file named
;; LICENSE from the original collection this file is distributed with.

(import
  (except (rnrs) error)
  (rnrs r5rs)
  (srfi s23 error)
  (srfi private include)
  (srfi s27 random-bits))

(define eval 'ignore)
(define interaction-environment 'ignore)

(define ascii->char integer->char)

(include/resolve ("srfi" "s27") "conftest.scm")

(check-mrg32k3a)
(display "passed (check-mrg32k3a)\n")
