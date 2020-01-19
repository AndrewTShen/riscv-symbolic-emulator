# RISC-V Symbolic Emulator

### Method
The main program is `emulate.rkt` which sets up the machine from and loads the program to be run from `load.rkt`. Then instructions are read in 4-bytes, converted to their readable forms using `instr.rkt` to get the format, `decode.rkt` to convert the binary to the normal format. `execute.rkt` finally performs that decoded symbolic value.

`emulate.rkt` -> `load.rkt` -> `instr.rkt` -> `decode.rkt` -> `execute.rkt`  

### Files
##### `load.rkt`
Initialize the machine and load the program into the machine to run symbolically. Initalize mutator and accessor functions for changing the memory in the function.
##### `decode.rkt`
Decode all of the binary instructions to a list similar to objdump output so that it is easier to parse.
##### `instr.rkt`
Return the instruction format for each of the opcodes.
##### `execute.rkt`
Execute each individual instruction symbolically and update the program count to the proper place. Used rv8.io for implementing instructions
##### `emulate.rkt`
Set up the machine and execute each instruction. Properties are proved at the end of the symbolic execution.