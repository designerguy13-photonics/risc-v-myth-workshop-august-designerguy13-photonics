\m4_TLV_version 1d: tl-x.org
\SV
//RISC-V labs solutions here
/////////////////////////////////////////////////////////////////////////////
////////////////LAB- NEXT PC ////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
https://myth2.makerchip.com/sandbox/0rkfAh4pA/0qjh8lQ#
-------------------------------------------------------------------------

   |cpu
      @0
         $reset = *reset;
         
         // LAB: Next PC
        // $inc_pc[31:0] = >>1$reset ? 0 : $pc[31:0] + 1;  /*---This one is wrong code-*/
         $pc[31:0] = 32'b0;
         $inc_pc[31:0] = >>1$reset ? 0 : $pc[31:0]+4;

--------------------------------------------------------------------------
////////////////log///////////////////////////////////
[Inferior 1 (process 21599) exited normally]
No stack.
verilator --debug --debugi 0 --gdbbt --no-dump-tree --cc +librescan +libext+.sv --top-module makerchip -y . -y /src/verilog -y /src/sandhost -y /src/proj_default -y /src/lib +incdir+. +incdir+./sv_url_inc +incdir+/src/verilog +incdir+/src/sandhost +incdir+/src/proj_default +incdir+/src/lib makerchip.sv --assert --trace
No stack.
Starting Verilator 4.027 devel rev v4.026-36-g22088c9
Starting Verilator 4.027 devel rev v4.026-36-g22088c9
[Inferior 1 (process 21629) exited normally]
No stack.
cd obj_dir ; cp /src/sim_main.cpp . ; /usr/bin/make -j 3 -f /src/Makefile_obj make[1]: Entering directory '/src/obj_dir' g++  -I.  -MMD -I/usr/local/share/verilator/include -I/usr/local/share/verilator/include/vltstd -DVM_COVERAGE=0 -DVM_SC=0 -DVM_TRACE=1 -Wno-sign-compare -Wno-uninitialized -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable -Wno-shadow      -DVL_DEBUG=1  -c -o sim_main.o sim_main.cpp
g++  -I.  -MMD -I/usr/local/share/verilator/include -I/usr/local/share/verilator/include/vltstd -DVM_COVERAGE=0 -DVM_SC=0 -DVM_TRACE=1 -Wno-sign-compare -Wno-uninitialized -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable -Wno-shadow      -DVL_DEBUG=1  -c -o verilated.o /usr/local/share/verilator/include/verilated.cpp
g++  -I.  -MMD -I/usr/local/share/verilator/include -I/usr/local/share/verilator/include/vltstd -DVM_COVERAGE=0 -DVM_SC=0 -DVM_TRACE=1 -Wno-sign-compare -Wno-uninitialized -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable -Wno-shadow      -DVL_DEBUG=1  -c -o verilated_vcd_c.o /usr/local/share/verilator/include/verilated_vcd_c.cpp
/usr/bin/perl /usr/local/share/verilator/bin/verilator_includer -DVL_INCLUDE_OPT=include Vmakerchip.cpp > Vmakerchip__ALLcls.cpp
/usr/bin/perl /usr/local/share/verilator/bin/verilator_includer -DVL_INCLUDE_OPT=include Vmakerchip__Trace.cpp Vmakerchip__Syms.cpp Vmakerchip__Trace__Slow.cpp > Vmakerchip__ALLsup.cpp
g++  -I.  -MMD -I/usr/local/share/verilator/include -I/usr/local/share/verilator/include/vltstd -DVM_COVERAGE=0 -DVM_SC=0 -DVM_TRACE=1 -Wno-sign-compare -Wno-uninitialized -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable -Wno-shadow      -DVL_DEBUG=1  -c -o Vmakerchip__ALLcls.o Vmakerchip__ALLcls.cpp
g++  -I.  -MMD -I/usr/local/share/verilator/include -I/usr/local/share/verilator/include/vltstd -DVM_COVERAGE=0 -DVM_SC=0 -DVM_TRACE=1 -Wno-sign-compare -Wno-uninitialized -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable -Wno-shadow      -DVL_DEBUG=1  -c -o Vmakerchip__ALLsup.o Vmakerchip__ALLsup.cpp
ar -cr Vmakerchip__ALL.a Vmakerchip__ALLcls.o Vmakerchip__ALLsup.o
ranlib Vmakerchip__ALL.a
g++    -g sim_main.o verilated.o verilated_vcd_c.o Vmakerchip__ALL.a    -o simx -lm -lstdc++ 2>&1 | c++filt
make[1]: Leaving directory '/src/obj_dir' obj_dir/simx +verilator+error+limit+100
Enabling waves...
Simulation PASSED!!!
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
///////////////LAB - FETCH (PART-1 AND 2)////////////////////////////
//////////////////////////////////////////////////////////////////////////
https://myth2.makerchip.com/sandbox/04xfJhBGq/0X6hX5V#
--------------------------------------------------------------------
\m4_TLV_version 1d: tl-x.org
\SV
   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
   
   m4_include_lib(['https://raw.githubusercontent.com/stevehoover/RISC-V_MYTH_Workshop/c1719d5b338896577b79ee76c2f443ca2a76e14f/tlv_lib/risc-v_shell_lib.tlv'])

\SV
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV

   // /====================\
   // | Sum 1 to 9 Program |
   // \====================/
   //
   // Program for MYTH Workshop to test RV32I
   // Add 1,2,3,...,9 (in that order).
   //
   // Regs:
   //  r10 (a0): In: 0, Out: final sum
   //  r12 (a2): 10
   //  r13 (a3): 1..10
   //  r14 (a4): Sum
   // 
   // External to function:
   m4_asm(ADD, r10, r0, r0)             // Initialize r10 (a0) to 0.
   // Function:
   m4_asm(ADD, r14, r10, r0)            // Initialize sum register a4 with 0x0
   m4_asm(ADDI, r12, r10, 1010)         // Store count of 10 in register a2.
   m4_asm(ADD, r13, r10, r0)            // Initialize intermediate sum register a3 with 0
   // Loop:
   m4_asm(ADD, r14, r13, r14)           // Incremental addition
   m4_asm(ADDI, r13, r13, 1)            // Increment intermediate register by 1
   m4_asm(BLT, r13, r12, 1111111111000) // If a3 is less than a2, branch to label named <loop>
   m4_asm(ADD, r10, r14, r0)            // Store final result to register a0 so that it can be read by main program
   
   // Optional:
   // m4_asm(JAL, r7, 00000000000000000000) // Done. Jump to itself (infinite loop). (Up to 20-bit signed immediate plus implicit 0 bit (unlike JALR) provides byte address; last immediate bit should also be 0)
   m4_define_hier(['M4_IMEM'], M4_NUM_INSTRS)

   |cpu
      @0
         $reset = *reset;
         // LAB: Fetch
         $pc[31:0] = 32'b0;
         $inc_pc[31:0] = $pc[31:0] + 4;
         $pc[31:0] = >>1$reset ? 0 : $inc_pc[31:0];
         
         $mem_rd_addr[M4_IMEM_INDEX_CNT+1:2] = $imem_rd_en ? 0 : $pc[M4_IMEM_INDEX_CNT+1:2];
      @1   
         $instr[31:0] = $imem_rd_data[31:0];
         




      // YOUR CODE HERE
      
      // Note: Because of the magic we are using for visualisation, if visualisation is enabled below,
      //       be sure to avoid having unassigned signals (which you might be using for random inputs)
      //       other than those specifically expected in the labs. You'll get strange errors for these.

   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
   
   // Macro instantiations for:
   //  o instruction memory
   //  o register file
   //  o data memory
   //  o CPU visualization
   |cpu
      m4+imem(@1)    // Args: (read stage)
      //m4+rf(@1, @1)  // Args: (read stage, write stage) - if equal, no register bypass is required
      //m4+dmem(@4)    // Args: (read/write stage)
   
   m4+cpu_viz(@4)    // For visualisation, argument should be at least equal to the last stage of CPU logic
                       // @4 would work for all labs
\SV
   endmodule
-------------------------------------------------------------------------------------------------------
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
///////////////LAB - INSTRUCTIONS TYPE DECODE////////////////////////////
//////////////////////////////////////////////////////////////////////////
https://myth2.makerchip.com/sandbox/04xfJhBGq/0y8hrnA#
--------------------------------------------------------(slidenumber = 10)

         //Lab : Instruction Types Decode
         $is_i_instr = $instr[6:2] ==? 5'b0000x ||
                       $instr[6:2] ==? 5'b001x0 ||
                       $instr[6:2] ==? 5'11001;
         $is_s_instr = $instr[6:2] ==? 5'b0100x ;
         $is_r_instr = $instr[6:2] ==? 5'b011x0 ||
                       $instr[6:2] ==? 5'b01011 ;
         $is_u_instr = $instr[6:2] ==? 5'b0x101;
         $is_b_instr = $instr[6:2] ==? 5'b11000 ;
         $is_j_instr = $instr[6:2] ==? 5'b11011 ;
         $is_r4_instr = $instr[6:2] ==? 5'b1000x  || $instr[6:2] ==? 5'b1001x;
-----------------------------------------------------------------------------
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
///////////////LAB - INSTRUCTIONS IMMEDIATE DECODE////////////////////////////
//////////////////////////////////////////////////////////////////////////
https://myth2.makerchip.com/sandbox/04xfJhBGq/0GZh1gj#
------------------------------------------------------------------------------
// Lab : Instruction Immidiate Decode
         $imm[31:0] = $is_i_instr ? 
                      { {21{$instr[31]}}, $instr[30:20]} :
                      $is_s_instr ?
                      { {21{$instr[31]}}, $instr[30:25], $instr[11:7]} :
                      $is_b_instr ?
                      { {19{$instr[31]}},{2{$instr[7]}}, $instr[30:25], $instr[11:8],1'b0} :
                      $is_u_instr ?
                      {  $instr[31:12] , {0{$instr[11:0]} }}:
                      $is_j_instr ?
                      { {11{$instr[31]}}, $instr[19:12], {2{$instr[20]}}, $instr[30:21], 1'b0} :
                      32'b0;
-----------------------------------------------------------------------------
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////
///////////////LAB - INSTRUCTIONS DECODE////////////////////////////
//////////////////////////////////////////////////////////////////////////
https://myth2.makerchip.com/sandbox/04xfJhBGq/0Y6hL8M#
--------------------------------------------------------------------slide-11----------
 // Lab : Instruction  Decode   
      @2    
         $funct7[6:0] = $instr[31:25];
         $funct3[2:0] = $instr[14:12];
         $rs1[4:0] = $instr[19:15];
         $rs2[4:0] = $instr[24:20];
         $rd[4:0] = $instr[11:7];
         $opcode[6:0] = $instr[6:0];
          

-----------------------------------------------------------
/////////////// LAB- REGISTER FILE READ //////////////////////////////////
////////////////////////////////////////////////////////////////////////
https://myth2.makerchip.com/sandbox/0rkfAh4pA/0qjh8lQ
-------------------------------------------------------------------
