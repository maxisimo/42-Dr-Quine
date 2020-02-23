<a href="https://www.42.fr/">
    <p><img src="https://www.universfreebox.com/UserFiles/image/site_logo.gif" alt="42 logo" title="42" align="right" /></p>
</a>
<p align="center"><img src="https://user-images.githubusercontent.com/34480775/75114240-db9d9280-5654-11ea-9fa2-18f534e4bcc5.JPG" /></p>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
![Skills](https://img.shields.io/badge/Skills-Algorithm&AI-9cf)
![Objectives](https://img.shields.io/badge/Objectives-self--replication-brightgreen)


This small algo project invites you to confront the principle of self-reproduction and the problems that derive from it. It is a perfect introduction to more complex projects, particularly malware projects.

## Mandatory part
For this project, you will have to recode three different programs, each with different properties. Each programs will have to be coded in C and in Assembly, and respectivly in a folder named C and ASM, each folders containing its own Makefile with the usual rules.
### Colleen
* The executable of the first program must be named Colleen.
* When executed, the program must display on the standard output an output identical to the source code of the file used to compile the program.
* The source code must contain at least :
  - A main function.
  - Two different comments.
  - One of the comments must be present in the main function
  - One of the comments must be present outside of your program.
  - Another function in addition to the main function (which of course will be called)
  
### Grace
For the second program :
* The executable must be named Grace.
* When executed, the program writes in a file named Grace_kid.c/Grace_kid.s the source code of the file used to compile the program.
* The source code must strickly contain
  - No main declared.
  - Three defines only.
  - One comment.
* The program will run by calling a macro

### Sully
For the last program :
* The executable must be named Sully.
* When executed the program writes in a file named Sully_X.c/Sully_X.s. The X will be an interger given in the source. Once the file is created, the program compiles this file and then runs the new program (which will have the name of its source file).
* Stopping the program depends on the file name : the resulting program will be executed only if the integer X is greater than 0.
* An integer is therefore present in the source of your program and will have to evolve by decrementing every time you create a source file from the execution of the program.
* You have no constraints on the source code, apart from the integer that will be set to 5 at first.

### Compiling
run `make`

### Running
```
./Colleen
./Grace
./Sully
```
## Bonuses
The only Bonus accepted during p2p is to have redone this project entirely in the language of your choice.
I choosed to redone it in JavaScript.
