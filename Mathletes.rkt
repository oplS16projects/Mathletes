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


;; Defining boy and girl characters
(define setBoyCharacter 
  character-boy)

(define setGirlCharacter 
  character-pink-girl)


;; Defining Players

(define (player1 n)
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

;; Variables for position of x and y of gems

;;Row three gems
(define gem5X 150)
(define gem5Y 377)

(define gem6X 350)
(define gem6Y 377)

(define gem7X 550)
(define gem7Y 377)

(define gem8X 750)
(define gem8Y 377)

;;Row one gems
(define gemX 050)
(define gemY 125)

(define gem2X 250)
(define gem2Y 125)

(define gem3X 650)
(define gem3Y 125)

(define gem4X 850)
(define gem4Y 125)

;;Row two gems
(define gem9X 150)
(define gem9Y 209)

(define gem10X 350)
(define gem10Y 209)

(define gem11X 550)
(define gem11Y 209)

(define gem12X 750)
(define gem12Y 209)
;; Variables for position of x and y of player
(define player1X 850)
(define player1Y 545)

;; Variables for position of x and y of star
(define starX 450)
(define starY 293)

;; Text for submit
(define submit (text "Submit" 20 "Gold"))

;; Text for Instructions
(define instructions-tag (text "Instructions: " 20 "Black"))
(define instructions-summary-a (text "Press the F1 key to be a girl character and the F2 key to be a boy character!" 20 "Black"))
(define instructions-summary-b (text "Use the arrow keys to move you're player in order to collect the appropriate number of gems" 20 "Black"))
(define instructions-summary-c (text "Move over the star tile to submit you're answer" 20 "Black"))

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

;; Create a window size 900 by 850
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
                      (htdp:make-posn gemX gemY)
                      (htdp:make-posn gem2X gem2Y)
                      (htdp:make-posn starX starY)
                      (htdp:make-posn gem3X gem3Y)
                      (htdp:make-posn gem4X gem4Y)
                      (htdp:make-posn gem5X gem5Y)
                      (htdp:make-posn gem6X gem6Y)
                      (htdp:make-posn gem7X gem7Y)
                      (htdp:make-posn gem8X gem8Y)
                      (htdp:make-posn gem9X gem9Y)
                      (htdp:make-posn gem10X gem10Y)
                      (htdp:make-posn gem11X gem11Y)
                      (htdp:make-posn gem12X gem12Y)
                      (htdp:make-posn (- gemX 400) (+ gemY 200))
                      (htdp:make-posn starX (- starY 40))
                      (htdp:make-posn 450 303)
                      (htdp:make-posn 450 (+ 545 100))
       
                      (htdp:make-posn 450 (+ 545 150))
                      
                      (htdp:make-posn 450 (+ 545 200))
                      
                      (htdp:make-posn 450 (+ 545 250))
                      
                      ) window)
)

;;resets gem locations
(define (gemReset)

  (set! gemX 050)
  (set! gemY 125)
  
  (set! gem2X 250)
  (set! gem2Y 125)
  
  (set! gem3X 650)
  (set! gem3Y 125)
  
  (set! gem4X 850)
  (set! gem4Y 125)
  
  (set! gem5X 150)
  (set! gem5Y 377)
  
  (set! gem6X 350)
  (set! gem6Y 377)
  
  (set! gem7X 550)
  (set! gem7Y 377)
  
  (set! gem8X 750)
  (set! gem8Y 377)
  
  (set! gem9X 150)
  (set! gem9Y 209)
  
  (set! gem10X 350)
  (set! gem10Y 209)
  
  (set! gem11X 550)
  (set! gem11Y 209)
  
  (set! gem12X 750)
  (set! gem12Y 209)
 )

;; The user moved over the submit tile
;; Check to see if the answer is correct
;; If yes, add points and display new problem.
;; If not, subtract points and reset gem count. 
(define (submitCollision)
  ;;reset gems
  (gemReset)
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
    )
 )
(define (change w a-key) 
  (cond
    [(key=? a-key "left")  (cond ((= player1leftCount 8))
                                 ((and (= (- player1X 100) starX) (= player1Y starY)) (begin (set! player1rightCount (- player1rightCount 1)) (set! player1leftCount (+ player1leftCount 1)) (set! player1X (- player1X 100)) )(submitCollision))
                                 ((and (= (- player1X 100) gemX) (= player1Y gemY))(begin (set! gemCount (+ gemCount 1)) (set! gemX  -500) (set! gemY -500) (set! player1rightCount (- player1rightCount 1)) (set! player1leftCount (+ player1leftCount 1)) (set! player1X (- player1X 100)) ))
                                 ((and (= (- player1X 100) gem2X) (= player1Y gem2Y))(begin (set! gemCount (+ 1 gemCount))(set! gem2X  -500) (set! gem2Y -500) (set! player1rightCount (- player1rightCount 1)) (set! player1leftCount (+ player1leftCount 1)) (set! player1X (- player1X 100)) ))                                 
                                 ((and (= (- player1X 100) gem3X) (= player1Y gem3Y))(begin (set! gemCount (+ gemCount 1)) (set! gem3X  -500) (set! gem3Y -500) (set! player1rightCount (- player1rightCount 1)) (set! player1leftCount (+ player1leftCount 1)) (set! player1X (- player1X 100)) ))
                                 ((and (= (- player1X 100) gem4X) (= player1Y gem4Y))(begin (set! gemCount (+ gemCount 1)) (set! gem4X  -500) (set! gem4Y -500) (set! player1rightCount (- player1rightCount 1)) (set! player1leftCount (+ player1leftCount 1)) (set! player1X (- player1X 100)) ))
                                 ((and (= (- player1X 100) gem5X) (= player1Y gem5Y))(begin (set! gemCount (+ gemCount 1)) (set! gem5X  -500) (set! gem5Y -500) (set! player1rightCount (- player1rightCount 1)) (set! player1leftCount (+ player1leftCount 1)) (set! player1X (- player1X 100)) ))
                                 ((and (= (- player1X 100) gem6X) (= player1Y gem6Y))(begin (set! gemCount (+ gemCount 1)) (set! gem6X  -500) (set! gem6Y -500) (set! player1rightCount (- player1rightCount 1)) (set! player1leftCount (+ player1leftCount 1)) (set! player1X (- player1X 100)) ))
                                 ((and (= (- player1X 100) gem7X) (= player1Y gem7Y))(begin (set! gemCount (+ gemCount 1)) (set! gem7X  -500) (set! gem7Y -500) (set! player1rightCount (- player1rightCount 1)) (set! player1leftCount (+ player1leftCount 1)) (set! player1X (- player1X 100)) ))
                                 ((and (= (- player1X 100) gem8X) (= player1Y gem8Y))(begin (set! gemCount (+ gemCount 1)) (set! gem8X  -500) (set! gem8Y -500) (set! player1rightCount (- player1rightCount 1)) (set! player1leftCount (+ player1leftCount 1)) (set! player1X (- player1X 100)) ))
                                 ((and (= (- player1X 100) gem9X) (= player1Y gem9Y))(begin (set! gemCount (+ gemCount 1)) (set! gem9X  -500) (set! gem9Y -500) (set! player1rightCount (- player1rightCount 1)) (set! player1leftCount (+ player1leftCount 1)) (set! player1X (- player1X 100)) ))
                                 ((and (= (- player1X 100) gem10X) (= player1Y gem10Y))(begin (set! gemCount (+ gemCount 1)) (set! gem10X  -500) (set! gem10Y -500) (set! player1rightCount (- player1rightCount 1)) (set! player1leftCount (+ player1leftCount 1)) (set! player1X (- player1X 100)) ))
                                 ((and (= (- player1X 100) gem11X) (= player1Y gem11Y))(begin (set! gemCount (+ gemCount 1)) (set! gem11X  -500) (set! gem11Y -500) (set! player1rightCount (- player1rightCount 1)) (set! player1leftCount (+ player1leftCount 1)) (set! player1X (- player1X 100)) ))
                                 ((and (= (- player1X 100) gem12X) (= player1Y gem12Y))(begin (set! gemCount (+ gemCount 1)) (set! gem12X  -500) (set! gem12Y -500) (set! player1rightCount (- player1rightCount 1)) (set! player1leftCount (+ player1leftCount 1)) (set! player1X (- player1X 100)) ))
                                 (else (begin (set! player1rightCount (- player1rightCount 1)) (set! player1leftCount (+ player1leftCount 1)) (set! player1X (- player1X 100)) )))] 

    [(key=? a-key "right") (cond ((= player1rightCount 8))
                                 ((and (= (+ player1X 100) starX) (= player1Y starY))(begin (set! player1rightCount (+ player1rightCount 1)) (set! player1leftCount (- player1leftCount 1)) (set! player1X (+ player1X 100)) )(submitCollision))
                                 ((and (= (+ player1X 100) gemX) (= player1Y gemY)) (begin (set! gemCount (+ gemCount 1))  (set! gemX -500) (set! gemY -500) (set! player1leftCount (- player1leftCount 1)) (set! player1rightCount (+ player1rightCount 1)) (set! player1X (+ player1X 100)) ))                                 
                                 ((and (= (+ player1X 100) gem2X) (= player1Y gem2Y)) (begin (set! gemCount (+ gemCount 1))  (set! gem2X -500) (set! gem2Y -500) (set! player1leftCount (- player1leftCount 1)) (set! player1rightCount (+ player1rightCount 1)) (set! player1X (+ player1X 100)) ))                                 
                                 ((and (= (+ player1X 100) gem3X) (= player1Y gem3Y)) (begin (set! gemCount (+ gemCount 1))  (set! gem3X -500) (set! gem3Y -500) (set! player1leftCount (- player1leftCount 1)) (set! player1rightCount (+ player1rightCount 1)) (set! player1X (+ player1X 100)) ))
                                 ((and (= (+ player1X 100) gem4X) (= player1Y gem4Y)) (begin (set! gemCount (+ gemCount 1))  (set! gem4X -500) (set! gem4Y -500) (set! player1leftCount (- player1leftCount 1)) (set! player1rightCount (+ player1rightCount 1)) (set! player1X (+ player1X 100)) ))
                                 ((and (= (+ player1X 100) gem5X) (= player1Y gem5Y)) (begin (set! gemCount (+ gemCount 1))  (set! gem5X -500) (set! gem5Y -500) (set! player1leftCount (- player1leftCount 1)) (set! player1rightCount (+ player1rightCount 1)) (set! player1X (+ player1X 100)) ))
                                 ((and (= (+ player1X 100) gem6X) (= player1Y gem6Y)) (begin (set! gemCount (+ gemCount 1))  (set! gem6X -500) (set! gem6Y -500) (set! player1leftCount (- player1leftCount 1)) (set! player1rightCount (+ player1rightCount 1)) (set! player1X (+ player1X 100)) ))
                                 ((and (= (+ player1X 100) gem7X) (= player1Y gem7Y)) (begin (set! gemCount (+ gemCount 1))  (set! gem7X -500) (set! gem7Y -500) (set! player1leftCount (- player1leftCount 1)) (set! player1rightCount (+ player1rightCount 1)) (set! player1X (+ player1X 100)) ))
                                 ((and (= (+ player1X 100) gem8X) (= player1Y gem8Y)) (begin (set! gemCount (+ gemCount 1))  (set! gem8X -500) (set! gem8Y -500) (set! player1leftCount (- player1leftCount 1)) (set! player1rightCount (+ player1rightCount 1)) (set! player1X (+ player1X 100)) ))
                                 ((and (= (+ player1X 100) gem9X) (= player1Y gem9Y)) (begin (set! gemCount (+ gemCount 1))  (set! gem9X -500) (set! gem9Y -500) (set! player1leftCount (- player1leftCount 1)) (set! player1rightCount (+ player1rightCount 1)) (set! player1X (+ player1X 100)) ))
                                 ((and (= (+ player1X 100) gem10X) (= player1Y gem10Y)) (begin (set! gemCount (+ gemCount 1))  (set! gem10X -500) (set! gem10Y -500) (set! player1leftCount (- player1leftCount 1)) (set! player1rightCount (+ player1rightCount 1)) (set! player1X (+ player1X 100)) ))
                                 ((and (= (+ player1X 100) gem11X) (= player1Y gem11Y)) (begin (set! gemCount (+ gemCount 1))  (set! gem11X -500) (set! gem11Y -500) (set! player1leftCount (- player1leftCount 1)) (set! player1rightCount (+ player1rightCount 1)) (set! player1X (+ player1X 100)) ))
                                 ((and (= (+ player1X 100) gem12X) (= player1Y gem12Y)) (begin (set! gemCount (+ gemCount 1))  (set! gem12X -500) (set! gem12Y -500) (set! player1leftCount (- player1leftCount 1)) (set! player1rightCount (+ player1rightCount 1)) (set! player1X (+ player1X 100)) ))
                                 (else (begin (set! player1leftCount (- player1leftCount 1)) (set! player1rightCount (+ player1rightCount 1)) (set! player1X (+ player1X 100)))))]

    [(key=? a-key "up")    (cond ((= player1upCount 6))
                                 ((and (= player1X  starX) (= (- player1Y 84) starY))(begin (set! player1upCount (+ player1upCount 1)) (set! player1downCount (- player1downCount 1)) (set! player1Y (- player1Y 84)))(submitCollision))
                                 ((and (= player1X gemX) (= (- player1Y 84) gemY)) (begin (set! gemCount (+ gemCount 1))  (set! gemX -500) (set! gemY -500) (set! player1upCount (+ player1upCount 1)) (set! player1downCount (- player1downCount 1)) (set! player1Y (- player1Y 84))))
                                 ((and (= player1X gem2X) (= (- player1Y 84) gem2Y)) (begin (set! gemCount (+ 1 gemCount))  (set! gem2X -500) (set! gem2Y -500) (set! player1upCount (+ player1upCount 1)) (set! player1downCount (- player1downCount 1)) (set! player1Y (- player1Y 84))))
                                 ((and (= player1X gem3X) (= (- player1Y 84) gem3Y)) (begin (set! gemCount (+ 1 gemCount))  (set! gem3X -500) (set! gem3Y -500) (set! player1upCount (+ player1upCount 1)) (set! player1downCount (- player1downCount 1)) (set! player1Y (- player1Y 84))))                                                                ((and (= player1X gem2X) (= (- player1Y 84) gem2Y)) (begin (set! gemCount (+ 1 gemCount))  (set! gem2X -500) (set! gem2Y -500) (set! player1upCount (+ player1upCount 1)) (set! player1downCount (- player1downCount 1)) (set! player1Y (- player1Y 84))))
                                 ((and (= player1X gem4X) (= (- player1Y 84) gem4Y)) (begin (set! gemCount (+ 1 gemCount))  (set! gem4X -500) (set! gem4Y -500) (set! player1upCount (+ player1upCount 1)) (set! player1downCount (- player1downCount 1)) (set! player1Y (- player1Y 84))))
                                 ((and (= player1X gem5X) (= (- player1Y 84) gem5Y)) (begin (set! gemCount (+ 1 gemCount))  (set! gem5X -500) (set! gem5Y -500) (set! player1upCount (+ player1upCount 1)) (set! player1downCount (- player1downCount 1)) (set! player1Y (- player1Y 84))))
                                 ((and (= player1X gem6X) (= (- player1Y 84) gem6Y)) (begin (set! gemCount (+ 1 gemCount))  (set! gem6X -500) (set! gem6Y -500) (set! player1upCount (+ player1upCount 1)) (set! player1downCount (- player1downCount 1)) (set! player1Y (- player1Y 84))))
                                 ((and (= player1X gem7X) (= (- player1Y 84) gem7Y)) (begin (set! gemCount (+ 1 gemCount))  (set! gem7X -500) (set! gem7Y -500) (set! player1upCount (+ player1upCount 1)) (set! player1downCount (- player1downCount 1)) (set! player1Y (- player1Y 84))))
                                 ((and (= player1X gem8X) (= (- player1Y 84) gem8Y)) (begin (set! gemCount (+ 1 gemCount))  (set! gem8X -500) (set! gem8Y -500) (set! player1upCount (+ player1upCount 1)) (set! player1downCount (- player1downCount 1)) (set! player1Y (- player1Y 84))))
                                 ((and (= player1X gem9X) (= (- player1Y 84) gem9Y)) (begin (set! gemCount (+ 1 gemCount))  (set! gem9X -500) (set! gem9Y -500) (set! player1upCount (+ player1upCount 1)) (set! player1downCount (- player1downCount 1)) (set! player1Y (- player1Y 84))))
                                 ((and (= player1X gem10X) (= (- player1Y 84) gem10Y)) (begin (set! gemCount (+ 1 gemCount))  (set! gem10X -500) (set! gem10Y -500) (set! player1upCount (+ player1upCount 1)) (set! player1downCount (- player1downCount 1)) (set! player1Y (- player1Y 84))))
                                 ((and (= player1X gem11X) (= (- player1Y 84) gem11Y)) (begin (set! gemCount (+ 1 gemCount))  (set! gem11X -500) (set! gem11Y -500) (set! player1upCount (+ player1upCount 1)) (set! player1downCount (- player1downCount 1)) (set! player1Y (- player1Y 84))))
                                 ((and (= player1X gem12X) (= (- player1Y 84) gem12Y)) (begin (set! gemCount (+ 1 gemCount))  (set! gem12X -500) (set! gem12Y -500) (set! player1upCount (+ player1upCount 1)) (set! player1downCount (- player1downCount 1)) (set! player1Y (- player1Y 84))))
                                 (else (begin (set! player1upCount (+ player1upCount 1)) (set! player1downCount (- player1downCount 1)) (set! player1Y (- player1Y 84)))))]

    [(key=? a-key "down")  (cond ((= player1downCount 5))
                                 ((and (= player1X starX) (= (+ player1Y 84) starY))(begin (set! player1downCount (+ player1downCount 1)) (set! player1upCount (- player1upCount 1)) (set! player1Y (+ player1Y 84)))(submitCollision))                                
                                 ((and (= player1X gemX) (= (+ player1Y 84) gemY)) (begin (set! gemCount (+ gemCount 1))  (set! gemX -500) (set! gemY -500) (set! player1downCount (+ player1downCount 1)) (set! player1upCount (- player1upCount 1)) (set! player1Y (+ player1Y 84))))
                                 ((and (= player1X gem2X) (= (+ player1Y 84) gem2Y)) (begin (set! gemCount (+ gemCount 1))  (set! gem2X -500) (set! gem2Y -500) (set! player1downCount (+ player1downCount 1)) (set! player1upCount (- player1upCount 1)) (set! player1Y (+ player1Y 84))))
                                 ((and (= player1X gem3X) (= (+ player1Y 84) gem3Y)) (begin (set! gemCount (+ gemCount 1))  (set! gem3X -500) (set! gem3Y -500) (set! player1downCount (+ player1downCount 1)) (set! player1upCount (- player1upCount 1)) (set! player1Y (+ player1Y 84))))
                                 ((and (= player1X gem4X) (= (+ player1Y 84) gem4Y)) (begin (set! gemCount (+ gemCount 1))  (set! gem4X -500) (set! gem4Y -500) (set! player1downCount (+ player1downCount 1)) (set! player1upCount (- player1upCount 1)) (set! player1Y (+ player1Y 84))))
                                 ((and (= player1X gem5X) (= (+ player1Y 84) gem5Y)) (begin (set! gemCount (+ gemCount 1))  (set! gem5X -500) (set! gem5Y -500) (set! player1downCount (+ player1downCount 1)) (set! player1upCount (- player1upCount 1)) (set! player1Y (+ player1Y 84))))
                                 ((and (= player1X gem6X) (= (+ player1Y 84) gem6Y)) (begin (set! gemCount (+ gemCount 1))  (set! gem6X -500) (set! gem6Y -500) (set! player1downCount (+ player1downCount 1)) (set! player1upCount (- player1upCount 1)) (set! player1Y (+ player1Y 84))))
                                 ((and (= player1X gem7X) (= (+ player1Y 84) gem7Y)) (begin (set! gemCount (+ gemCount 1))  (set! gem7X -500) (set! gem7Y -500) (set! player1downCount (+ player1downCount 1)) (set! player1upCount (- player1upCount 1)) (set! player1Y (+ player1Y 84))))
                                 ((and (= player1X gem8X) (= (+ player1Y 84) gem8Y)) (begin (set! gemCount (+ gemCount 1))  (set! gem8X -500) (set! gem8Y -500) (set! player1downCount (+ player1downCount 1)) (set! player1upCount (- player1upCount 1)) (set! player1Y (+ player1Y 84))))
                                 ((and (= player1X gem9X) (= (+ player1Y 84) gem9Y)) (begin (set! gemCount (+ gemCount 1))  (set! gem9X -500) (set! gem9Y -500) (set! player1downCount (+ player1downCount 1)) (set! player1upCount (- player1upCount 1)) (set! player1Y (+ player1Y 84))))
                                 ((and (= player1X gem10X) (= (+ player1Y 84) gem10Y)) (begin (set! gemCount (+ gemCount 1))  (set! gem10X -500) (set! gem10Y -500) (set! player1downCount (+ player1downCount 1)) (set! player1upCount (- player1upCount 1)) (set! player1Y (+ player1Y 84))))
                                 ((and (= player1X gem11X) (= (+ player1Y 84) gem11Y)) (begin (set! gemCount (+ gemCount 1))  (set! gem11X -500) (set! gem11Y -500) (set! player1downCount (+ player1downCount 1)) (set! player1upCount (- player1upCount 1)) (set! player1Y (+ player1Y 84))))
                                 ((and (= player1X gem12X) (= (+ player1Y 84) gem12Y)) (begin (set! gemCount (+ gemCount 1))  (set! gem12X -500) (set! gem12Y -500) (set! player1downCount (+ player1downCount 1)) (set! player1upCount (- player1upCount 1)) (set! player1Y (+ player1Y 84))))
                                 (else (begin (set! player1downCount (+ player1downCount 1)) (set! player1upCount (- player1upCount 1)) (set! player1Y (+ player1Y 84)))))]

    [(key=? a-key "f1")  (setGirl)]
    [(key=? a-key "f2")  (setBoy)]
   ))

(define (setGirl)
  (set! player1  setGirlCharacter))

(define (setBoy)
  (set! player1  setBoyCharacter))

(define (ready)
  (setBoy)
  (big-bang '(50 . 445) 
          (to-draw scenes) 
          (on-key change)

       
))
(ready)