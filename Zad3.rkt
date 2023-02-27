#lang racket

(define (nwd a b)
  (if (= b 0)
      a
      (nwd b (modulo a b))))

(define (nww a b)
  (/ (* a b) (nwd a b)))

(nwd 12 18)