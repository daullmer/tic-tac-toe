# CESP Tic-Tac-Toe

Simple Tic-Tac-Toe game with support for one and two players.

## Authors

- Philip Prüßner
- Victoria Strobel
- David Ullmer

## Demo Video

[![Video Thumbnai](http://img.youtube.com/vi/-h3eH4ubuno/0.jpg)](http://www.youtube.com/watch?v=-h3eH4ubuno "CESP Demo Video")


## Description


### How to run
To start the game, open src/main.asm in [Rars](). Open the Bitmap display, set the pixel unit width and height to 2, the resolution to 512x512 and the Display Base Address to ox1004000 (Heap) and connect to programm. To interact with the game, follow the instructions in the Rars Run I/O console.

## Files

`src/main.asm`: Main file of program

`src/draw/`: files for drawing things on the display

`src/libs/`: constant definitions for running the game in Rars.

`test/draw/`: unit tests for drawing things on screen


## Test
Screenshot that shows succedded (unit) tests 
