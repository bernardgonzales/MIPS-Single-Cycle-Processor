# MIPS-Pipelined-Single-Cycle-Processor
This design is a Pipelined Single Cycle MIPS processor. 

The following are the milestones I took to complete this project:
1. Set up and test each of the following modules: Program Counter, Instruction Memory, Register File, ALU and Data Memory.
2. Connect all modules to support basic load word and store word instructions. 
3. Add control unit to connect to the multiplexers select lines and any write enables that were needed to be set up in the top level test bench. This allows the processor to take in more variety of instructions. (I-type, J-type, R-type).
4. Pipeline the processor by adding 4 pipeline registers throughout the processor. 
  a. In between the Instruction Memory and Register File. 
  b. In between the Register File and ALU. 
  c. In between the ALU and Data Memory. 
  d. After the data memory and before the 3rd multiplexer. 
 
 IMPORTANT NOTES:
 - When incrementing the program counter, I needed to increment by one rather than four. Although MIPS processors do increment every 32 bits, I needed to increment by one instead due to reading machine code from a .dat file. 
 - During the pipeline process, I removed the fifth multiplexer and the shift left module (used by the jump instruction) for the program to increment. Will look into this fix. 
