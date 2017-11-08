#!r6rs
;; Copyright 2010 Derick Eddington.  My MIT-style license is in the file named
;; LICENSE from the original collection this file is distributed with.

(import
  (except (rnrs) error)
  (rnrs r5rs)
  (rename (only (rnrs) write) (write pretty-write))
  (srfi s23 error)
  (srfi s42 eager-comprehensions)
  (srfi private include)
  (srfi s67 compare-procedures))

(include/resolve ("srfi" "s67") "examples.scm")
