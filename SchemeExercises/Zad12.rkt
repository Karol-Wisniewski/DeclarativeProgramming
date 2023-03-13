#lang racket

(define (filter-accumulate combiner null-value term a next b pred)
    (if (and (> a b) (not (pred a)))
        null-value
        (if (pred a)
            (combiner (term a) (filter-accumulate combiner null-value term (next a) next b pred))
            (filter-accumulate combiner null-value term (next a) next b pred))))

(filter-accumulate 
    (lambda (x y) (+ x y))
    0
    (lambda (x) x)
    2
    (lambda (x) (+ x 1))
    6
    (lambda (x) (even? x)))