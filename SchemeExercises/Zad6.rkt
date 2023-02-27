#lang racket

;Wersja rekurencyjna

(define (sil n)
  (if (= n 0)
      1
      (* n (sil (- n 1)))))


;Wersja iteracyjna z akumulatorem


(define (silAcc n)
  (let loop ((i 1) (acc 1))
    (if (> i n)
        acc
        (loop (+ i 1) (* i acc)))))

(sil 5)
(silAcc 5)