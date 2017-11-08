#!r6rs
;; Copyright 2010 Derick Eddington.  My MIT-style license is in the file named
;; LICENSE from the original collection this file is distributed with.

(import
  (rnrs)
  (rnrs r5rs)
  (srfi s42 eager-comprehensions)
  (srfi private include)
  (srfi s78 lightweight-testing))

(include/resolve ("srfi" "s78") "examples.scm")
