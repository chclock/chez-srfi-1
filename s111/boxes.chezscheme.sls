#!r6rs
(library (srfi s111 boxes)
  (export box box? unbox set-box!)
  (import (only (chezscheme) box box? unbox set-box!)))
