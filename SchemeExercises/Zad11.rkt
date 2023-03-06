#lang racket


(define (sum-integer a b)
  (if (> a b)
      0
      (+ a (sum-integer (+ a 1) b))))

;;; (sum-integer 2 4)


(define (product term a next b)
    (if (> a b)
        1
        (* (term a) (product term (next a) next b))))

;;; (product (lambda (x) x)
;;;          2
;;;          (lambda (x) (+ x 1))
;;;          4)

(define (sil n)
    (product (lambda (x) x)
             1
             (lambda (x) (+ x 1))
             n))


(define (accumulate combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner (term a) (accumulate combiner null-value term (next a) next b))))

;sum

(accumulate 
    (lambda (x y) (+ x y))
    0
    (lambda (x) x)
    2
    (lambda (x) (+ x 1))
    4)

;sil

(accumulate 
    (lambda (x y) (* x y))
    1
    (lambda (x) x)
    2
    (lambda (x) (+ x 1))
    4)