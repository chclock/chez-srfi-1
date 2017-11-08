#!r6rs
;; Copyright 2010 Derick Eddington.  My MIT-style license is in the file named
;; LICENSE from the original collection this file is distributed with.

(import
  (except (rnrs base) error)
  (rnrs lists)
  (srfi s23 error)
  (srfi private include)
  (srfi s64 testing))

(include/resolve ("srfi" "s64") "srfi-64-test.scm")
