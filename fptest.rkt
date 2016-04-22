#lang racket

(require 2htdp/image)
(require 2htdp/universe)
(require 2htdp/planetcute)
(require (prefix-in htdp: lang/htdp-beginner))
(require racket/format)

(define (stack imgs)
  (cond [(empty? (rest imgs)) (first imgs)]
        [else (underlay/xy (first imgs) 0 82
                          (stack (rest imgs)))]))

> (define img (beside/align
   "top"
   (stack (list water-block wood-block wood-block wood-block wood-block wood-block))
   (stack (list water-block wood-block wood-block wood-block wood-block wood-block))
   (stack (list water-block wood-block wood-block wood-block wood-block wood-block))
   (stack (list water-block wood-block wood-block wood-block wood-block wood-block))
   (stack (list water-block wood-block wood-block wood-block wood-block wood-block))
   (stack (list water-block wood-block wood-block wood-block wood-block wood-block))
   (stack (list water-block wood-block wood-block wood-block wood-block wood-block))
   (stack (list water-block wood-block wood-block wood-block wood-block wood-block))
   (stack (list water-block wood-block wood-block wood-block wood-block wood-block))
   ))

(define playerName1
  (text "Test1" 12 "black"))

(define setBoyCharacter 
  (list character-boy character-boy))

(define setGirlCharacter 
  (list character-pink-girl))

(define (player1 n)
  (begin (car setBoyCharacter)))

(define (player2 n)
  (begin (car setBoyCharacter)))

(define player1leftCount 0)
(define player1rightCount 8)
(define player1upCount 0)
(define player1downCount 5)
(define player1score 0)
(define gemX 450)
(define gemY 293)
(define player1X 850)
(define player1Y 545)


(define window (empty-scene 900 600))

(define count (lambda (x) 
                 (text (number->string x) 40 "red")))


(define (scenes imgs) 
  (place-images (list player1 playerName1 (count player1score) gem-blue img) 
                (list (htdp:make-posn player1X player1Y)
                      (htdp:make-posn player1X (- player1Y 40))
                      (htdp:make-posn 50 65)
                      (htdp:make-posn gemX gemY)
                      (htdp:make-posn 450 303)) window)
)

(define (change w a-key) 
  (cond
    [(key=? a-key "left")  (cond ((= player1leftCount 8) (cons player1X player1Y))
                                 ((and (= (- player1X 100) gemX) (= player1Y gemY)) (begin (set! player1score (+ 1 player1score)) (count player1score) (set! gemX  -100) (set! gemY -100) (set! player1rightCount (- player1rightCount 1)) (set! player1leftCount (+ player1leftCount 1)) (set! player1X (- player1X 100)) (cons player1X player1Y)))
                                 (else (begin (set! player1rightCount (- player1rightCount 1)) (set! player1leftCount (+ player1leftCount 1)) (set! player1X (- player1X 100)) (cons player1X player1Y))))] 
    [(key=? a-key "right") (cond ((= player1rightCount 8) (cons player1X player1Y))
                                 ((and (= (+ player1X 100) gemX) (= player1Y gemY)) (begin (set! player1score (+ 1 player1score)) (count player1score) (set! gemX -100) (set! gemY -100) (set! player1leftCount (- player1leftCount 1)) (set! player1rightCount (+ player1rightCount 1)) (set! player1X (+ player1X 100)) (cons player1X player1Y)))
                                 (else (begin (set! player1leftCount (- player1leftCount 1)) (set! player1rightCount (+ player1rightCount 1)) (set! player1X (+ player1X 100)) (cons player1X player1Y))))]
    [(key=? a-key "up")    (cond ((= player1upCount 5) (cons player1X player1Y))
                                 ((and (= player1X gemX) (= (- player1Y 84) gemY)) (begin (set! player1score (+ 1 player1score)) (count player1score) (set! gemX -100) (set! gemY -100) (set! player1upCount (+ player1upCount 1)) (set! player1downCount (- player1downCount 1)) (set! player1Y (- player1Y 84)) (cons player1X player1Y)))
                                 (else (begin (set! player1upCount (+ player1upCount 1)) (set! player1downCount (- player1downCount 1)) (set! player1Y (- player1Y 84)) (cons player1X player1Y))))]
    [(key=? a-key "down")  (cond ((= player1downCount 5) (cons (car w) (cdr w)))
                                 ((and (= (car w) gemX) (= (+ (cdr w) 84) gemY)) (begin (set! player1score (+ 1 player1score)) (count player1score) (set! gemX -100) (set! gemY -100) (set! player1downCount (+ player1downCount 1)) (set! player1upCount (- player1upCount 1)) (set! player1Y (+ player1Y 84)) (cons player1X player1Y)))
                                 (else (begin (set! player1downCount (+ player1downCount 1)) (set! player1upCount (- player1upCount 1)) (set! player1Y (+ player1Y 84)) (cons player1X player1Y))))]

   ))

(define (placeChar) 
  (cond ((list character-boy)(begin (set! player1 (cond ((= (random 2) 0) (car setBoyCharacter))
               (else (car (cdr setBoyCharacter)))))(set! player1 (cond ((= (random 2) 0) (car setBoyCharacter))
               (else (car setGirlCharacter))))))
       (else (begin (set! player1 (cond ((= (random 2) 0) (car setBoyCharacter))
              (else (car (cdr setBoyCharacter))))) (set! player1 (cond ((= (random 2) 0) (car setGirlCharacter))
               (else (car setGirlCharacter))))))))
  
(define (ready)
  (placeChar)
  (big-bang '(50 . 445) 
          (to-draw scenes) 
          (on-key change)
       
))
(ready)
