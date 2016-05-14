;; Copyright (C) Taylan Ulrich Bayırlı/Kammer (2015). All Rights Reserved.

;; Permission is hereby granted, free of charge, to any person obtaining
;; a copy of this software and associated documentation files (the
;; "Software"), to deal in the Software without restriction, including
;; without limitation the rights to use, copy, modify, merge, publish,
;; distribute, sublicense, and/or sell copies of the Software, and to
;; permit persons to whom the Software is furnished to do so, subject to
;; the following conditions:

;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
;; LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
;; OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
;; WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#!r6rs
(library (srfi :17 generalized-set!)
  (export (rename (%set! set!)) setter getter-with-setter)
  (import
    (rnrs base)
    (rnrs bytevectors)
    (rnrs hashtables)
    (rnrs mutable-strings)
    (rnrs mutable-pairs)
    (except (srfi :1) map for-each))
  (begin

    (define-syntax %set!
      (syntax-rules ()
        ((_ (getter arg ...) val)
         ((setter getter) arg ... val))
        ((_ var val)
         (%set! var val))))
    
    (define setter
      (let ((setters (make-eq-hashtable 64)))
        (letrec ((setter
                  (lambda (proc)
                    (hashtable-ref setters proc
                                   (lambda () (error "No setter for " proc)))))
                 (set-setter!
                  (lambda (proc setter)
                    (hashtable-set! setters proc setter))))
          
          (define (fn-swap-3-4 setter)
            (lambda (bv k e v)
              (setter bv k v e))) 
          
          (set-setter! setter set-setter!)
          (set-setter! car set-car!)
          (set-setter! cdr set-cdr!)
          (set-setter! caar (lambda (p v) (set-car! (car p) v)))
          (set-setter! cadr (lambda (p v) (set-car! (cdr p) v)))
          (set-setter! cdar (lambda (p v) (set-cdr! (car p) v)))
          (set-setter! cddr (lambda (p v) (set-cdr! (cdr p) v)))
          (set-setter! caaar (lambda (p v) (set-car! (caar p) v)))
          (set-setter! caadr (lambda (p v) (set-car! (cadr p) v)))
          (set-setter! cadar (lambda (p v) (set-car! (cdar p) v)))
          (set-setter! caddr (lambda (p v) (set-car! (cddr p) v)))
          (set-setter! cdaar (lambda (p v) (set-cdr! (caar p) v)))
          (set-setter! cdadr (lambda (p v) (set-cdr! (cadr p) v)))
          (set-setter! cddar (lambda (p v) (set-cdr! (cdar p) v)))
          (set-setter! cdddr (lambda (p v) (set-cdr! (cddr p) v)))
          (set-setter! list-ref (lambda (l n v)
                                  (let loop ((l l))
                                    (cond
                                     ((zero? n)
                                      (set-car! l v))
                                     (else (loop (cdr l)))))))
          (set-setter! vector-ref vector-set!)
          (set-setter! string-ref string-set!)
          (set-setter! hashtable-ref hashtable-set!)
          
          (set-setter! bytevector-uint-ref
                       (lambda (bv k e s n)
                         (bytevector-uint-set! bv k n e s)))
          (set-setter! bytevector-sint-ref
                       (lambda (bv k e s n)
                         (bytevector-sint-set! bv k n e s)))
          
          (set-setter! bytevector-u8-ref bytevector-u8-set!)
          (set-setter! bytevector-s8-ref bytevector-s8-set!)
          
          (set-setter! bytevector-u16-ref (fn-swap-3-4 bytevector-u16-set!))
          (set-setter! bytevector-s16-ref (fn-swap-3-4 bytevector-s16-set!))
          (set-setter! bytevector-u32-ref (fn-swap-3-4 bytevector-u32-set!))
          (set-setter! bytevector-s32-ref (fn-swap-3-4 bytevector-s32-set!))
          (set-setter! bytevector-u64-ref (fn-swap-3-4 bytevector-u64-set!))
          (set-setter! bytevector-s64-ref (fn-swap-3-4 bytevector-s64-set!))
          
          (set-setter! bytevector-u16-native-ref bytevector-u16-native-set!)
          (set-setter! bytevector-s16-native-ref bytevector-s16-native-set!)
          (set-setter! bytevector-u32-native-ref bytevector-u32-native-set!)
          (set-setter! bytevector-s32-native-ref bytevector-s32-native-set!)
          (set-setter! bytevector-u64-native-ref bytevector-u64-native-set!)
          (set-setter! bytevector-s64-native-ref bytevector-s64-native-set!)
          
          (set-setter! bytevector-ieee-single-ref (fn-swap-3-4 bytevector-ieee-single-set!))
          (set-setter! bytevector-ieee-single-ref (fn-swap-3-4 bytevector-ieee-single-set!))
          (set-setter! bytevector-ieee-double-ref (fn-swap-3-4 bytevector-ieee-double-set!))
          (set-setter! bytevector-ieee-double-ref (fn-swap-3-4 bytevector-ieee-double-set!))
          
          (set-setter! bytevector-ieee-single-native-ref bytevector-ieee-single-native-set!)
          (set-setter! bytevector-ieee-single-native-ref bytevector-ieee-single-native-set!)
          (set-setter! bytevector-ieee-double-native-ref bytevector-ieee-double-native-set!)
          (set-setter! bytevector-ieee-double-native-ref bytevector-ieee-double-native-set!)
          
          setter)))

    (define (getter-with-setter get set)
      (let ((proc (lambda args (apply get args))))
        (%set! (setter proc) set)
        proc))

    ))
