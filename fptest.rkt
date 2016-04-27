#lang racket

;; Rajia and Jeremy Math Adventures
;; Last Updated: 4/27/16

;; Add Libraries
(require 2htdp/image)
(require 2htdp/universe)
(require 2htdp/planetcute)
(require (prefix-in htdp: lang/htdp-beginner))
(require racket/format)

(define (stack imgs)
  (cond [(empty? (rest imgs)) (first imgs)]
        [else (underlay/xy (first imgs) 0 82
                          (stack (rest imgs)))]))

;; Create  images of blocks
;; Blocks are created by stacking images in columns
> (define img (beside/align          
   "top"
   (stack (list wood-block wood-block wood-block wood-block wood-block wood-block))
   (stack (list wood-block wood-block wood-block wood-block wood-block wood-block))
   (stack (list wood-block wood-block wood-block wood-block wood-block wood-block))
   (stack (list wood-block wood-block wood-block wood-block wood-block wood-block))
   (stack (list wood-block wood-block wood-block wood-block wood-block wood-block))
   (stack (list wood-block wood-block wood-block wood-block wood-block wood-block))
   (stack (list wood-block wood-block wood-block wood-block wood-block wood-block))
   (stack (list wood-block wood-block wood-block wood-block wood-block wood-block))
   (stack (list wood-block wood-block wood-block wood-block wood-block wood-block))
   ))


;; Give the player a name using a text object, black font and size 20.
(define playerName1
  (text "Player 1" 20 "black"))

;; Defining boy and girl characters
(define setBoyCharacter 
  (list character-boy character-boy))

(define setGirlCharacter 
  (list character-pink-girl))


;; Defining Players

(define (player1 n)
  (begin (car setBoyCharacter)))

(define (player2 n)
  (begin (car setBoyCharacter)))


;; Variables for left, right, up down count

(define player1leftCount 0)
(define player1rightCount 8)
(define player1upCount 0)
(define player1downCount 5)



;; Variables for Math Problems
(define operand1 1)
(define operand2 3)
(define operator '+)

;; Variable for score
(define player1score 0)

;; Variable for score
(define gemCount 0)

;; Variables for position of x and y of gem
(define gemX 450)
(define gemY 293)

;; Variables for position of x and y of player
(define player1X 850)
(define player1Y 545)

;; Variables for position of x and y of gem
(define starX 450)
(define starY 293)

;; Text for submit
(define submit (text "Submit" 20 "Gold"))

;; Text for Instructions
(define instructions-tag (text "Instructions: " 20 "Gold"))
(define instructions-summary-a (text "Press the f1 key as many times as you'd like to randomly change you're character's gender!" 20 "Gold"))
(define instructions-summary-b (text "Use the arrow keys to move you're player in order to collect the appropriate number of gems" 20 "Gold"))
(define instructions-summary-c (text "Move over the star tile to submit you're answer" 20 "Gold"))

;; Functions to Define operands to new values
(define (set-operand1 new-operand)
  (set! operand1 new-operand)
)

(define (set-operand2 new-operand)
  (set! operand2 new-operand)
)

;; A list of the problems currently created
(define list-of-problems '(
                           (1 3) ;; Problem 1
                           (3 2)   ;; Problem 2
                           (2 2)   ;; Problem 3
                           (4 0)   ;; Problem 4
                           (1 2)   ;; Problem 5
                           )
)

;; Function to change the problem number
(define prob-number-counter 1)
(define (set-operands-for-new-problem lst count problemnumber)
    (if (= count problemnumber) 
        (begin
          (set-operand1 (car (car lst)))
          (set-operand2 (car (cdr (car lst))))
         )
        (set-operands-for-new-problem (cdr lst) (+ count 1) problemnumber)
    )
 )

;; The above function will be called when the user submits a problem and will be used to change to another problem
;; The following calls will be made:
; Update Operands to New Problem: (set-operands-for-new-problem list-of-problems current-prob-number 4) where 4 will represent whatever problem number you would like displayed
; Update Text: (problem-to-solve operand1 operand2)

;; Create a window size 900 by 600
(define window (empty-scene 900 850))

;; Creating text to display count 
(define count (lambda (x) 
                 (text (string-append "# Gems: " (number->string x)) 30 "Black")))

;; Creating text to display score 
(define score (lambda (x) 
                 (text (string-append "Score: " (number->string x)) 30 "Black")))

;; Creating text for the problem
(define problem-to-solve (lambda (x y) 
                 (text (string-append "Please Collect: " (number->string x) " + " (number->string y) " Gems") 30 "Black")))


;; Placing Images and Text on the Board
(define (scenes imgs) 
  (place-images (list player1 (problem-to-solve operand1 operand2) (count gemCount)(score player1score) gem-blue gem-blue yellow-star gem-blue gem-blue gem-blue gem-blue gem-blue gem-blue gem-blue gem-blue gem-blue gem-blue gem-blue submit img instructions-tag instructions-summary-a  instructions-summary-b instructions-summary-c) 
                (list (htdp:make-posn player1X player1Y)
                      (htdp:make-posn 180 30)
                      (htdp:make-posn 810 30)
                      (htdp:make-posn 650 30)
                      (htdp:make-posn (- gemX 400) gemY)
                      (htdp:make-posn (- gemX 200)  gemY)
                      (htdp:make-posn starX starY)
                      (htdp:make-posn gemX (- gemY 200))
                      (htdp:make-posn (- gemX 200) (- gemY 200))
                      (htdp:make-posn (+ gemX 200) (- gemY 200))
                      (htdp:make-posn (- gemX 400) (- gemY 200))
                      (htdp:make-posn (+ gemX 400) (- gemY 200))
                      (htdp:make-posn (- gemX 200) (+ gemY 200))
                      (htdp:make-posn (+ gemX 200) (+ gemY 200))
                      (htdp:make-posn gemX (+ gemY 200))
                      (htdp:make-posn (+ gemX 200) gemY)
                      (htdp:make-posn (+ gemX 400) gemY)
                      (htdp:make-posn (- gemX 400) (+ gemY 200))
                      (htdp:make-posn starX (- starY 40))
                      (htdp:make-posn 450 303)
                      (htdp:make-posn 450 (+ 545 100))
       
                      (htdp:make-posn 450 (+ 545 150))
                      
                      (htdp:make-posn 450 (+ 545 200))
                      
                      (htdp:make-posn 450 (+ 545 250))
                      
                      ) window)
)

;; The user moved over the submit tile
;; Check to see if the answer is correct

;; If yes, add points and display new problem.
;; If not, subtract points and reset gem count. 
(define (submitCollision)
  ;; Check to see if all the problems have been displayed, if yes reset problems
  (if (= prob-number-counter 6)
      (set! prob-number-counter 1)
      (set! prob-number-counter (+ prob-number-counter 0))
  )
  (if (= gemCount (+ operand1 operand2))
        (begin
          ;; The user solved the problem correctly! Award them points:
          (set! player1score (+ player1score 10))
          (score player1score)
          ;; Advance the problem number and display the new problem on the screen
          (set-operands-for-new-problem list-of-problems prob-number-counter (+ 1 prob-number-counter))
          (problem-to-solve operand1 operand2)
          ;; Increment prob-number-counter
          (set! prob-number-counter (+ prob-number-counter 1))
          ;; Reset Gem Count so they can start new problem.
          (set! gemCount 0)
          (count gemCount)

        )
        (begin
          ;; The user solved the problem incorrectly, subtract points.  
          (set! player1score (- player1score 10))
          (score player1score)
          ;; Reset Gem Count so they can try again.
          (set! gemCount 0)
          (count gemCount)
        )
    ))
(define (change w a-key) 
  (cond
    [(key=? a-key "left")  (cond ((= player1leftCount 8) (cons player1X player1Y))
                                 ((and (= (- player1X 100) gemX) (= player1Y gemY)) (begin (set! gemCount (+ gemCount 0)) (submitCollision) (set! gemX  -100) (set! gemY -100) (set! player1rightCount (- player1rightCount 1)) (set! player1leftCount (+ player1leftCount 1)) (set! player1X (- player1X 100)) (cons player1X player1Y)))
                                 ((and (= (- player1X 100) gemX) (= player1Y gemY)) (begin (set! gemCount (+ 1 gemCount)) (count gemCount) (set! gemX  -100) (set! gemY -100) (set! player1rightCount (- player1rightCount 1)) (set! player1leftCount (+ player1leftCount 1)) (set! player1X (- player1X 100)) (cons player1X player1Y)))                                 
                                 (else (begin (set! player1rightCount (- player1rightCount 1)) (set! player1leftCount (+ player1leftCount 1)) (set! player1X (- player1X 100)) (cons player1X player1Y))))] 
    [(key=? a-key "right") (cond ((= player1rightCount 8) (cons player1X player1Y))
                                 ((and (= (+ player1X 100) gemX) (= player1Y gemY)) (begin (set! gemCount (+ gemCount 0)) (submitCollision) (set! gemX -100) (set! gemY -100) (set! player1leftCount (- player1leftCount 1)) (set! player1rightCount (+ player1rightCount 1)) (set! player1X (+ player1X 100)) (cons player1X player1Y)))                                 
                                 ((and (= (+ player1X 100) gemX) (= player1Y gemY)) (begin (set! gemCount (+ 1 gemCount)) (count gemCount) (set! gemX -100) (set! gemY -100) (set! player1leftCount (- player1leftCount 1)) (set! player1rightCount (+ player1rightCount 1)) (set! player1X (+ player1X 100)) (cons player1X player1Y)))                                 
                                 (else (begin (set! player1leftCount (- player1leftCount 1)) (set! player1rightCount (+ player1rightCount 1)) (set! player1X (+ player1X 100)) (cons player1X player1Y))))]
    [(key=? a-key "up")    (cond ((= player1upCount 6) (cons player1X player1Y))
                                 ((and (= player1X gemX) (= (- player1Y 84) gemY)) (begin (set! gemCount (+ gemCount 0)) (submitCollision) (set! gemX -100) (set! gemY -100) (set! player1upCount (+ player1upCount 1)) (set! player1downCount (- player1downCount 1)) (set! player1Y (- player1Y 84)) (cons player1X player1Y)))
                                 ((and (= player1X gemX) (= (- player1Y 84) gemY)) (begin (set! gemCount (+ 1 gemCount)) (count gemCount) (set! gemX -100) (set! gemY -100) (set! player1upCount (+ player1upCount 1)) (set! player1downCount (- player1downCount 1)) (set! player1Y (- player1Y 84)) (cons player1X player1Y)))
                                
                                 (else (begin (set! player1upCount (+ player1upCount 1)) (set! player1downCount (- player1downCount 1)) (set! player1Y (- player1Y 84)) (cons player1X player1Y))))]
    [(key=? a-key "down")  (cond ((= player1downCount 5) (cons (car w) (cdr w)))
                                 ((and (= (car w) gemX) (= (+ (cdr w) 84) gemY)) (begin (set! gemCount (+ gemCount 0)) (submitCollision) (set! gemX -100) (set! gemY -100) (set! player1downCount (+ player1downCount 1)) (set! player1upCount (- player1upCount 1)) (set! player1Y (+ player1Y 84)) (cons player1X player1Y)))
                                 ((and (= (car w) gemX) (= (+ (cdr w) 84) gemY)) (begin (set! gemCount (+ 1 gemCount)) (count gemCount) (set! gemX -100) (set! gemY -100) (set! player1downCount (+ player1downCount 1)) (set! player1upCount (- player1upCount 1)) (set! player1Y (+ player1Y 84)) (cons player1X player1Y)))
                                 (else (begin (set! player1downCount (+ player1downCount 1)) (set! player1upCount (- player1upCount 1)) (set! player1Y (+ player1Y 84)) (cons player1X player1Y))))]
    [(key=? a-key "f1")  (placeChar)]
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