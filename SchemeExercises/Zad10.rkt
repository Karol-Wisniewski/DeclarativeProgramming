#lang racket

(define (sum-integer a b)
  (if (> a b)
      0
      (+ a (sum-integer (+ a 1) b))))

(sum-integer 2 4)


(define (product term a next b)
    (if (> a b)
        1
        (* (term a) (product term (next a) next b))))

(define (sil n)
    (product (lambda (x) x)
             1
             (lambda (x) (+ x 1))
             n))

(sil 5)