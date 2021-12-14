#lang sicp
10
(+ 5 4 3)

(define a 3)
(define b (+ a 1))
(+ a b (* a b))
(= a b)
(if (and (> b a) (< b (* a b)))
    b
    a)

(cond((= a 4) 6)
     ((= b 4) (+ 6 7 a))
     (else 25))

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))