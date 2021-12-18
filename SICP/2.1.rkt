#lang sicp
;下面首先是原始的make-rat的定义和其他功能
(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))


(define (numer x) (car x))
(define (denom x) (cdr x))


(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y)) (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y)) (* (numer y) (denom x)))
            (* (denom x) (denom y))))


(define (print-rat x)

  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))

;先测试下教材上make-rat的基本功能
(define a (make-rat 1 2))
(define b (make-rat 1 3))
(print-rat a)
(print-rat b)
(print-rat (add-rat b b))
(print-rat (sub-rat b a))
(define c (make-rat -1 2))
(print-rat c)
(define d (make-rat 1 -2))
(print-rat d)
;从输出结果可以看到，make-rat当前确实还无法完美处理负数，做出修改
;最先想到的方法是对符号进行判断，而后调用之前的基本make-rat时加上符号

(define (make-rat-new x y)
  (make-rat ((if (or (and (> x 0) (< y 0)) (and (< x 0) (> y 0))  ) - +) x) (abs y)))

(display "new version:")
(newline)
(define a2 (make-rat-new 1 2))
(define b2 (make-rat-new 1 3))
(print-rat a2)
(print-rat b2)
(print-rat (add-rat b2 b2))
(print-rat (sub-rat b2 a2))
(define c2 (make-rat-new -1 2))
(print-rat c)
(define d2 (make-rat-new 1 -2))
(print-rat d2)