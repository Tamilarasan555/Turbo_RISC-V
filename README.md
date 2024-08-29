# RISC-V Single-Core Processor

This project implements a basic RISC-V single-core processor.
The processor is designed to execute instructions in a simplified RISC-V architecture, featuring instruction fetching, decoding, execution, memory access, and write-back stages.

**Features:**
  32-bit data path
  ALU with arithmetic and logic operations
  Instruction fetching and decoding
  Branching and memory access
  Support for immediate value extension


**Internal Architecture:**
  The processor is composed of several key components interconnected to perform the various tasks needed to execute instructions.

#Internal Wires:
  Program Counter (pctop): Holds the address of the current instruction.
  Instruction (rdtop):     The instruction fetched from memory.
  Registers (rd1top, rd2top): Data read from the register file.
  Immediate Extension (Immexttop): Extended immediate value from the instruction.
  ALU Result (aluresulttop): Output from the ALU.
  Memory Data (readdata): Data read from data memory.
  Next PC (pcnext): The address of the next instruction to be executed.
  ALU Control (alucontroltop): Control signals for the ALU operations.
  Register Addresses (a1, a2, a3): Register indices extracted from the instruction.
  Control Signals: Various signals controlling the behavior of the processor.


**Components:**
1. Program Counter
    Manages the current instruction address and provides it to the instruction memory.
2. Instruction Memory
    Fetches the instruction corresponding to the current program counter.
3. Register File
    Contains general-purpose registers.
    Supports reading from and writing to registers based on the instruction.
4. Immediate Extension
    Extends the immediate values from the instruction for use in calculations.
5. ALU (Arithmetic Logic Unit)
    Performs arithmetic and logical operations.
    Generates important flags such as overflow, carry, and zero.
6. Control Unit
    Decodes instructions and generates control signals for different operations (ALU, branching, memory access, etc.).
7. Data Memory
    Handles data loads and stores based on the ALU's result.
8. Multiplexers
    Instruction Address Multiplexer: Selects between the next sequential instruction and the branch target.
    ALU Operand Multiplexer: Selects between a register value or an immediate value as an ALU input.
    Write-Back Multiplexer: Selects the value to be written back to the register file.
9. Branch Target Calculation
    Calculates the target address for branch instructions.
