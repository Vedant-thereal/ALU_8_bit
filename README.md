# ALU_8_bit
This project is based on the Verilog implementation of a simple 8-bit unsigned Arithmetic Logic Unit(ALU).\
The ALU supports 8 operations, viz:
|Operation     | Input Size      | Output Size                               | MUX i/p for command |
|--------------|-----------------|-------------------------------------------|---------------------|
|Addition      | 2 8-bit numbers | one 8-bit sum and one 1-bit carry         | 000                 |
|Subtration    | 2 8-bit numbers | one 8-bit difference                      | 001                 |
|Multiplication| 2 8-bit numbers | one 16-bit product                         | 010                 |
|Division      | 2 8-bit numbers | one 8-bit quotient and one 8-bit remainder| 011                 |
|Bitwise AND   | 2 8-bit numbers | one 8-bit AND                             | 100                 |
|Bitwise OR    | 2 8-bit numbers | one 8-bit AND                             | 101                 |
|Bitwise NOR   | 2 8-bit numbers | one 8-bit AND                             | 110                 |
|Bitwise NAND  | 2 8-bit numbers | one 8-bit AND                             | 111                 |

Addition and Subtraction are performed using conventional Full-Adders with mode selection.\
Multiplication is performed by using addition and register level bit shifts.Two accumulator registers are used(acc1 and acc2) initialized to 0 before operation starts.Then for i=0 to 7(Not using 'for' loops in verilog code) clock cycles, acc1 is initialized to b[i]&(a) padded with 4 zeros to the right and added to acc2, after this operation acc2 is shifted right by 1 bit.\
Division is performed using Restoring Divsion Algorithm\
All the bitwise operations are performed using the usual primitive gates in Verilog\
Made by Vedant P Rajpurohit and Jash Muni
