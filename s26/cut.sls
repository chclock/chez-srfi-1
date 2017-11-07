#!r6rs
;; Copyright 2009 Derick Eddington.  My MIT-style license is in the file named
;; LICENSE from the original collection this file is distributed with.

(library (srfi s26 cut)
  (export cut cute)
  (import (rnrs) (srfi private include))
  
  (include/resolve ("srfi" "s26") "cut.scm")  
)
