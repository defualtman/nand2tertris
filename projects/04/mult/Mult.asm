// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

    @R2    //指代R2内存单元
    M=0    //设置R2的内存数值为0
    @i     //i指代某个内存单元
    M=0    //设置i的值为0
    D=M    //D=i
(LOOP) //开始计算R0和R1的乘积
    @R1
    D=D-M  //D=i-R1
    @END
    D;JEQ  //if(i-R1) = 0 goto END
    @R0
    D=M
    @R2
    MD=D+M
    @i
    MD=M+1
    @LOOP
    0;JMP  //goto LOOP
(END)
    @END
    0;JMP  //无限循环

