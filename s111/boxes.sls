#!r6rs
(library (srfi s111 boxes)
  (export box box? unbox set-box!)
  (import (rnrs records syntactic)
          (rnrs base))
  (begin
    (define-record-type (<box> box box?)
      (fields (mutable value unbox set-box!)))))
