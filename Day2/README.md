# RISC-V_MYTH_Workshop
This repository contains all the important takeaways that must be useful while building your own RISC-V Architecture using opensource platform by VSDFLOW and REDWOOD-EDA

  
# DAY-1 
It started with an introductory session by @kunalghosh and @Stevehoover and then 3 hours after that we were on an online platform VSD – IAT – VLSI System Design !!
So for the day-1 we were introduced to RISC-V ISA and GNU Compiler with a brief about overall system software and hardware approach

## Install the VSD-FLOW to your machine https://github.com/kunalg123/vsdflow

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/system-software.png?raw=true)

### It was now time to learns some C-coding to get familiar with and then write the sum1to9.c code that basically adds decimal number 1 to 9

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/sum1ton%20code.PNG?raw=true)

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/risc-v-commands_1.PNG?raw=true)

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/risc-v-commands_1_add_objectfile%20for%20output.PNG?raw=true)

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/risc-v-commands_1_add_objectfile%20for%20output_with%20Ofast%20option.PNG?raw=true)

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/risc-v-commands_1_final%20command%20to%20debug%20the%20c%20code%20toriscv%20assembly%20_add%20this%20to%20search%20for%20specific%20assembly%20lines.PNG?raw=true)

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/risc-v-commands_1_final%20command%20to%20debug%20the%20c%20code%20toriscv%20assembly.PNG?raw=true)

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/risc-v-commands_1_final%20command%20to%20run%20your%20c%20code%20with%20riscv%20arch.PNG?raw=true)

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/risc-v-commands_1_mabi.PNG?raw=true)

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/risc-v-commands_1_march.PNG?raw=true)

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/scroll%20down%20and%20type%20in%20here.PNG?raw=true)

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/starting%20address%20of%20main%20program%20debug%20without%20any%20add%20on%20instructions.PNG?raw=true)

 I tried the sum1ton.c code using three ways: clearly shown in following figure and found same number of assembly code lines for main block in case of both O1 and Ofast options.
![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/snipped_day-1.PNG?raw=true)
But then later I figured out this :
![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day2/Snippet-2-Day-1.PNG?raw=true)

# DAY-2
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

### Know we are all set to link this code with makerchip platform 
# Day-3 
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
# Day-4&5
We finally deeloped complete RISC-V architecture using Makerchip to generate the sum of numbers 1 to 9 in one of the register

![alt text](https://github.com/RISCV-MYTH-WORKSHOP/risc-v-myth-workshop-august-designerguy13-photonics/blob/master/Day3_5/final.png?raw=true)
