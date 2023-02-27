#lang racket

(define (same-values? p1 p2 x y)
  (and (p1 x y)
       (p2 x y)
       (equal? (p1 x y) (p2 x y))))

(same-values? (λ (x y) (and x y)) (λ (x y) (and x y)) #t #f)
