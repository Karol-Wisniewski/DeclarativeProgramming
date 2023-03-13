#lang racket

(define (append l m)
  (if (null? l)
      m
      (cons (car l) (append (cdr l) m))))


(define (last l)
  (cond ((null? l) '())
        ((null? (cdr l)) (car l))
        (else (last (cdr l))))) 


(define (reverse l)
  (if (null? l)
      '()
      (append (reverse (cdr l)) (list (car l)))))


(define (delete x l)
  (cond ((null? l) '())
        ((equal? x (car l)) (delete x (cdr l)))
        (else (cons (car l) (delete x (cdr l)))))) 


(define (pairing l1 l2)
  (if (or (null? l1) (null? l2))
      '()
      (cons (cons (car l1) (car l2)) (pairing (cdr l1) (cdr l2)))))


(define (split x l)
  (cond ((null? l) (list '() '()))
        ((< (car l) x)
         (let ((result (split x (cdr l))))
           (list (cons (car l) (car result)) (cadr result))))
        (else
         (let ((result (split x (cdr l))))
           (list (car result) (cons (car l) (cadr result)))))))


(append '(1 2) '(3 4))

(last '(1 2 3 4))

(reverse '(1 2 3 4))

(delete 2 '(1 2 3 4))

(pairing '(1 2 3) '(4 5 6))

(split 3 '(1 2 3 4 5 6))
