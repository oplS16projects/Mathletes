# Project Title: Math Adventures

### Statement

Some of the smartest people still can't do basic arithmitic. Say goodbye to boring flashcards and hello to a new fun innovative way to learn basic addition, subtraction, multiplication and division! Our team is going to set out to create a game that makes learning fun. It will allow users to select a character and then move over tiles to collect a specific number of items that solve a basic arithmitic problem. Users will have to collect the correct number of items to solve the problem. If they collect the correct number of items they are awarded points! 

We hope that this project will enable us to learn more about Racket libraries and enhance our abilities of coding in racket specifically using higher order procedures and object oriented programming. 

### Analysis

This project will allow us to learn more about Racket Libraries and to demonstrate our knowledge of Object-Oriented Programming as well as Higher-Order Procedures. 

The Racket libraries we plan on using include the racket/draw library because it provides basic drawing tools, the racket/gui library because it provides GUI widgets such as windows, buttons, checkboxes and text fields, and the 2htdp/image and 2htdp/planetcute libraries. The image library will be used for construction of basic images and the planet cute library will be used to for the charachter images and board tiles.

In order to allow the user to select a charachter we will need to use conditionals to check which charachter the user selected and then we will need to update the player's image accordingly. Next we will create a list of arithmetic problems and use higher-order procedures to construct a function that displays the arithmetic problems successively.  

Finally, we will display the board by stacking tiles on top of each other and implementing collision checking to see if the player is on an item or on the check answer tile. If they player is on an item we will change the image of the tile and increment the number of items tile. If the user is  on the check answer tile we will call the method to check if the number of items the user collected is the same as the answer to the problem. If they are equal, then the user will be awarded a certain number of points otherwise an error message will be displayed.   

### Data set or other source materials

The main resources we plan on using come from Racket Documentation:
 
  * racket/draw:        https://docs.racket-lang.org/draw/Drawing_Conveniences.html
  
  * racket/gui library  https://docs.racket-lang.org/gui/index.html
  
  * 2htdp/image         https://docs.racket-lang.org/teachpack/2htdpimage.html
  
  * 2htdp/planetcute:   https://docs.racket-lang.org/teachpack/2htdpPlanet_Cute_Images.html

We will be further exploring all of these libraries and following examples over the weekend prior to actually starting the project. 

### Deliverable and Demonstration

We are creating an interactive game that makes learning fun. The game will start by allowing users to select a character. Once they have made their selection, they will be prompted with various arithmetic challenges. They will have to move over tiles to collect a specific number of items which solve the problem they are prompted with before a timer runs out. Every time the user solves a problem correctly they will be awarded points! During the live demo, students in the class will be able to play the game and challenge others to see who can get the most points. 

### Evaluation of Results

We will consider our project to be successful if we are able to implement the core parts:

1. Allow the user to select a charachter
2. Prompt the User with Math Questions
3. Create a GUI that allows users to navigate over items and select them
4. Implement a method to check for success (whether or not the user solved the math problem correctly)
 
## Architecture Diagram
**TODO 

## Schedule

The Core things that need to be completed in order for our project to be successful include:

1. Allowing the User to Select a Character					
2. Displaying an Arithmetic Problem for the user to solve
3. Displaying a Board consisting of tiles, items to collect and a tile to check answer
4. Allowing the User to Move over the Board
5. Collison Checking to see if the user moved over an item or moved over the check answer tile
6. Point system to allow the user to receive a fixed amount of points if they solved the problem correctly and display next problem

### First Milestone (Fri Apr 15)

The firse week we will spend further exploring the Libraries we are using and setting them up. In addition, we will:

  1. Display an Arithmetic Problem
     a. Develop a list of arithmetic problems
     b. Create a function that displays each problem given the number of the problem

  2. Display the board
     a. Stack a fixed number of tiles
     b. Stack a fixed number of jewels
     c. Stack one jewel in the corner of the board that’s gold (or whatever color) to represent the check answer method. 

### Second Milestone (Fri Apr 22)

The second week we will:

  3.  Implement the Select Charachter Feature
      a. Users will be allowed to choose between different charachters they would like to play with
      b. Depending on their selection we will place that charachter on the board. 

  4.  Implement the functionality to allow user to move around the board
      a. The charachter the user choose should be able to move around the board when key strokes are pressed.
      b. Left should move the player left, right should move the player right and Up/Down should move the player respectively.

### Final Presentation (last week of semester)

The final week we will prepare for our final presentation and:

  5. Implement Collision Checking
      a. If a player moves over an item the item should be picked up 
          i. the tile image should change
         ii. a counter should be incremented to represent the number of gemsPicked

      b. If a player moves over the gold tile a method should be called to check the solution of the problem

  6. Implement Check Solution Function and Point System
      a. Given the problem number and the number of gems picked up this function should determine if the solution is correct
      b. If the solution is correct, then the user should be awarded a certain number of points and the points variable should be   incremented accordingly. 

## Group Responsibilities

### Rajia Abdelaziz @rajiaxoxo
will write the....

### Jeremy Daigneau @jdaigneau
will work on...

