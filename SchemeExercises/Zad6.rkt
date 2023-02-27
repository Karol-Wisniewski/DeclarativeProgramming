#lang racket

;Wersja rekurencyjna

(define (sil n)
  (if (= n 0)
      1
      (* n (sil (- n 1)))))



;Ewaluacja wyrażenia (sil 3) w wersji rekurencyjnej przebiega następująco:


;(sil 3)
;(* 3 (sil 2))
;(* 3 (* 2 (sil 1)))
;(* 3 (* 2 (* 1 (sil 0))))
;(* 3 (* 2 (* 1 1)))
;(* 3 (* 2 1))
;6

;Funkcja najpierw sprawdza, czy argument n jest równy zero. Jeśli tak, zwraca 1, w przeciwnym wypadku wywołuje się rekurencyjnie na wartości n-1 i mnoży ją przez n. Ewaluacja wyrażenia (sil 3) zaczyna się od wywołania (sil 3). Ponieważ n nie jest równe 0, funkcja wywołuje się rekurencyjnie na wartości (sil 2) i mnoży ją przez 3. Następnie wywołanie (sil 2) prowadzi do wywołania (sil 1), a wywołanie (sil 1) prowadzi do wywołania (sil 0). Funkcja (sil 0) zwraca 1, a wartość ta zostaje użyta do obliczenia (sil 1) i (sil 2). W końcu, funkcja (sil 3) zwraca 6, co jest wynikiem n! dla n=3.




;-----------------------------------------------------------------------------------------------------------



;Wersja iteracyjna z akumulatorem


(define (silAcc n)
  (let loop ((i 1) (acc 1))
    (if (> i n)
        acc
        (loop (+ i 1) (* i acc)))))

(sil 5)
(silAcc 5)


;Ewaluacja wyrażenia (sil 3) w wersji iteracyjnej z akumulatorem przebiega następująco:


;(sil 3)
;(loop 1 1)
;(loop 2 1)
;(loop 3 2)
;6

;Funkcja sil używa pętli loop, która akumuluje wynik w zmiennej acc. Początkowo, wartość i ustawiana jest na 1, a wartość acc ustawiana jest na 1. Pętla loop jest wykonywana, dopóki i nie przekroczy wartości n. W każdej iteracji i jest inkrementowane o 1, a acc jest pomnożone przez wartość i. Ewaluacja wyrażenia (sil 3) zaczyna się od wywołania (sil 3). Funkcja sil wywołuje wewnętrzną funkcję loop z argumentami 1 i 1. W pierwszej iteracji, wartość i zostaje zwiększona do 2, a acc jest pomnożone przez 1 (pierwszy czynnik w iloczynie). W drugiej iteracji, wartość i zostaje zwiększona do 3, a acc jest pomnożone przez 2 (drugi czynnik w iloczynie). W trzeciej iteracji, wartość i wynosi już 4, co przekracza wartość n, więc pętla kończy działanie, a wartość acc jest zwracana jako wynik funkcji sil. W tym przypadku wynosi ona 6, co jest wynikiem n! dla n=3.

;Wwersja rekurencyjna wykorzystuje stos systemowy, aby przechowywać kolejne wywołania rekurencyjne, co może prowadzić do problemów z wydajnością i przekroczeniem maksymalnej głębokości stosu w przypadku dużej wartości n. Wersja z akumulatorem działa iteracyjnie, bez konieczności tworzenia kolejnych ramek na stosie, co sprawia, że jest zwykle bardziej wydajna i niezawodna dla większych wartości n.

