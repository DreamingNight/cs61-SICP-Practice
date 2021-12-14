#lang sicp

(define (square x)
  (* x x))

(define (abs x)
  (if (> x 0)
      x
      (- x)))

(define (good-enough? guess x)
  (< (abs ( - (square guess) x)) 0.001))

(define (average a  b)
  (/ (+ a b) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x))
  )

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 2)

;上面是一个基本的利用牛顿迭代法求解平方根的过程，在Practice 1.6中提出了有趣的问题，使用cond包装来替代if，
;让我们看看效果（只替换sqrt-iter中的if
(define (new-if p then-clause else-clause)
  (cond (p then-clause)
        (else else-clause)))
(new-if (> 2 3) 0 5)

(define (sqrt-iter-new guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter-new (improve guess x) x))
  )
(define (sqrt-new x)
  (sqrt-iter-new 1.0 x))

(sqrt-new 2)

#|运行46行会导致非常有趣的结果，那就是程序无限递归，因为使用new-if代替if的话需要给它传入三个参数，传入的参数
需要被首先求职（也就是应用序，applicative-order），在sqrt-iter-new中调用new-if时第三个参数是递归调用sqrt-iter-new，
lisp解释器无论谓词p的值为真还是假都要先计算出第三个参数的值，导致无限递归
|#