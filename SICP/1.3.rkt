#lang sicp

(define (maxTwoSum a b c)
  (cond ((and (> a c) (> b c)) (+ a b))
        ((and (> c a) (> b a)) (+ c b))
        (else (+ a c)))
  )

(maxTwoSum 5 8)
