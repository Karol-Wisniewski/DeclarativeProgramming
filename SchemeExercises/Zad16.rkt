#lang racket

(define (iter f n)
  (define (iter-helper g i)
    (if (= i n)
        g
        (iter-helper (compose f g) (+ i 1))))
  (iter-helper f 1))

(define (nth-power x n)
  ((iter (lambda (y) (* y x)) n) 1))

(nth-power 2 5)