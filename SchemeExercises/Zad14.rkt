#lang racket

;;;define root f a b using half-interval--method
(define (root f a b)
    (define (iter a b)
    (let ((c (/ (+ a b) 2)))
      (cond ((< (abs (- a b)) 0.0001) c)
            ((< (f c) 0) (iter c b))
            (else (iter a c)))))
    (iter a b))

(root (lambda (x) (- (* x x) 2)) 1 2)

