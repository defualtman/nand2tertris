// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

(KBDLOOP)
    @KBD
    D=M

        @ISBLACK
        M=D
        @8192
        D=A
        @MAX
        M=D
        @i
        M=0
        @SCREEN
        D=A
        @SP
        M=D
        @WHITE
        D;JEQ
        @BLACK
        D;JGT
        (WHITE)
            @SCREEN
            MD=0
            @SCREENLOOP
            0;JMP

        (BLACK)
            @SCREEN
            MD=1
            @SCREENLOOP
            0;JMP

        (SCREENLOOP)
            @SCREEN
            D=M
            @SP
            M=D
            @i
            MD=M+1
            @MAX
            D=D-M
            @KBDLOOP
            D;JEQ
            @SCREENLOOP
            0;JMP

    @KBDLOOP
    0;JMP
