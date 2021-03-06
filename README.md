
# RISC-V_MYTH_Workshop
What an amazing project experience with RISC-V MYTH (Microprocessor for You in Thirty Hours) workshop conducted by VSDFLOW and REDWOOD-EDA
It is now time to pen down some important takeaways while you try to build your own RISC-V architecture.
Well let me tell you very frankly that I never understood any microprocessor architecture this way, the way I understand it now. All thanks to that hands-on experience using 
 **VSD-Flow-spike tool and Makerchip open-source platforms**
Couldn’t imagine that its possible to understand and then implement a complete RISC-V core with basic instruction set in just 5 days.
And that too using  C, assembly (pseudo codes)  and this emerging TL-Verilog for HDL implementation. 

# Table of Contents
- [What is RISC V?](#What-is-RISC-V?)
- [Day 1.](#Day-1)
- [Day 2.](#Day-2)
- [Day 3.](#Day-3)
- [Day 4-5.](#Day-4-5) 
- [Acknowledgements.](#Acknowledgements)

# What is RISC V?
  - A high-quality, license-free, royalty-free RISC ISA (Instruction set architecture)
  - Standard maintained by the non-profit RISC-V Foundation
  - Suitable for all types of computing systems
    – From Microcontrollers to Supercomputers
  - RISC-V is available freely under a permissive license
  - RISC-V is not a A company or a CPU implementation
  - Unlike other existing commercial ISAs, the RISC-V ISA is open and this makes it easy and flexible for anyone to build a       processor that supports it. 
  - This quick workshop helped me gain the overview of the software, the hardware aspect and hands on lab sessions were done     to learn debugging the architecture by your own. [it wasn't a mugging up thing at all]


# Day 1
It started with an introductory session by @kunalghosh and @Stevehoover and then 3 hours after that we were on an online platform VSD – IAT – VLSI System Design !!
So for the day-1 we were introduced to RISC-V ISA and GNU Compiler with a brief about overall system software and hardware approach

## Install the VSD-FLOW to your machine https://github.com/kunalg123/vsdflow

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/system-software.png?raw=true)

### It was now time to learns some C-coding to get familiar with and then write the sum1to9.c code that basically adds decimal number 1 to 9

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/sum1ton%20code.PNG?raw=true)

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/risc-v-commands_1.PNG?raw=true)

### I tried the sum1ton.c code using three ways: clearly shown in following figure and found same number of assembly code lines for main block in case of both -O1 and -Ofast risc-v debug options.
![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/snipped_day-1.PNG?raw=true)
But then later I figured out this :
![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/Snippet-2-Day-1.PNG?raw=true)

# Day 2
It started with learning about ABI )Application Binary Interface) which is a actually a sort of hand-shake between the application program and operating system kernel via standard libraries.
![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/ABI.png?raw=true)
It is actually a system of call-interface !!
![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/ABI2.png?raw=true)
Then we get to know the answers about following questions after performing the lab-exercise :
  - Why Risc-v has 32-bit registers only?
  - How ABI access the register
 
 The answer to first one is it belongs to little-endian memory addressing type
 and for latter follows the following snippets from lab
![alt text](?raw=true)

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/DAY-2-LAB-1.PNG?raw=true)

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/DAY-2-LAB-2.PNG?raw=true)

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/DAY-2-LAB-3.PNG?raw=true)

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/DAY-2-LAB-4.PNG?raw=true)

### Now we are all set to link this code with makerchip platform using TL verolog

But what is 
# Day 3 
answered this amazingly !!
## TL- Verilog
TL-Verilog is an extension for System Verilog, moreover it acts as an higher level abstraction for System verilog which makes HDL implementation very easy and error free. Here we deal the design at a transaction level assuming the design as a pipeline, where inputs would be provided and output will be generated at the end of the pipeline. 
  
  **PROS** : 
   - Code reduction , and thus less chances of being bug prone.
   - In pipelining ,the flip flops,registers and other staged signals are implied from the context. 
   - It is very easy to stage different sections without impacting the behaviour of the logic.
   - Validity feature which provides easier debugging, cleaner design, automated clock gating and better error checking       capabilities.

Some basic implications to go further !!
![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day3_5/absic%20implications%20about%20logic%20gate.PNG?raw=true)

Now we went on to design our calculator logic to understand the ALU functionality using both combinational and seuential logic design

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day3_5/SIMPLE%20COMBINATIONAL%20LOGIC%20USING%20TL-X%20VERILOG.PNG?raw=true)

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day3_5/FREE%20RUNNING%20COUNTER.PNG?raw=true)

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day3_5/Lab%20_Counter%20and%20Calculator%20in%20Pipeline.PNG?raw=true)

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day3_5/LAB%20PIPELINE.PNG?raw=true)

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day3_5/lAB%20VECTORS.PNG?raw=true)

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day3_5/LAB-2-CYCLE-CALCULATOR-Slide_number-36.PNG?raw=true)

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day3_5/LOAD_PYTHAGOREAN_EXAMPLE_SNAPSHOT_MAKERCHIP.PNG?raw=true)

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day3_5/seuential%20calc%20full%20snippet.PNG?raw=true)
# Day 4-5
Having sleepless nights on Day-3 and Day-4 to understand the TL-verilog flow and basic calculator logics, the plan to implemented  the following blocks become much more easy:
  
  - Program Counter (PC)
  - Imem-Rd ( Instruction Memory)
  - Instruction Decoder
  - Register File Read
  - Arithmatic Logic Unit (ALU)
  - Register File Write
  - Branch
  
Thus the instruction set architecture of base integer instructions, The register file, branching,etc. and eventually the CPU core was built and tested(using appropriate testbench logic, and assembly code developed on Day 2) at the end of the day ,in similar progressive fashion like the previous day.
 Finally, the above architecture is pipelined as follows :
   - A 3 cycle RISC V pipelined core, with all the base integer instruction sets was developed. 
   - For Load and store a Data memory element was added with neccessary instruction decoding logic.
   - Register Bypass and Squashing techniques were also incorporated to prevent `Read followed by write`
     and `branching`hazards, arised due to pipelining.
   - Testing of the pipeline design was done in same manner with Load and store incorporated in asm code.
   - Additionally Incorporation of Jump feature (JAL and JALR instructions) was also done.The code can be found [here](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day3_5/risc-v_solutions.tlv).

**Final RISC V CPU Core-I**
![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day3_5/FINAL-RISC-V-1.png?raw=true)

**Final RISC V CPU Core-II**
![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day3_5/FINAL-RISC-V-IMAGE-2.png?raw=true)

# Acknowledgements
- [Kunal Ghosh](https://github.com/kunalg123), Co-founder (VSD Corp. Pvt. Ltd)
- [Steve Hoover](https://github.com/stevehoover), Founder, Redwood EDA.
- [Shivam Potdar](https://github.com/shivampotdar), GSoC 2020 Student,FOSSi Foundation.
- [Vineet Jain](https://github.com/vineetjain07), GSoC 2020 Student, FOSSi Foundation.
