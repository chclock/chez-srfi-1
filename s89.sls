(library (srfi s89)
  (export define* lambda*
          ;; Need after expansion time
          $hash-keyword
          $perfect-hash-table-lookup
          $undefined
          $req-key
          $opt-key
          $process-keys)
  (import (srfi s89 optional-parameters))
)
