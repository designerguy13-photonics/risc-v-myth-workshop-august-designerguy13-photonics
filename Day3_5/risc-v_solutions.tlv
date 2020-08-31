\m4_TLV_version 1d: tl-x.org
\SV
//RISC-V labs solutions here
///////////////////DAY-4//////////////////////////////////////////////////////////
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
///////////////////////////////////////////////////////////////
////////////////Lab: RISC-V Instruction Field Decode/////////////
///////////////////////////////////////////////////////////////
https://myth2.makerchip.com/sandbox/04xfJhBGq/08qh6rK#
------------------------------------------------------------------
  //  RISC-V INSTRUCTION FIELD DECODE
      @2    
         $rs2_valid = $is_r_instr || $is_s_instr || $is_b_instr;
         ?$rs2_valid
            $rs2[4:0] = $instr[24:20];
         $rs1_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
         ?$rs1_valid
            $rs1[4:0] = $instr[19:15];
         $funct3_valid = $is_r_instr || $is_i_instr || $is_s_instr ;
         ?$funct3_valid
            $funct3[2:0] = $instr[14:12];
         $funct7_valid = $is_r_instr ;
         ?$funct7_valid
            $funct7[6:0] = $instr[31:25];
         $rd_valid = $is_r_instr || $is_i_instr || $is_u_instr || $is_j_instr;
         ?$rd_valid
            $rd[4:0] = $instr[11:7];
         $opcode_valid = $is_r_instr || $is_i_instr || $is_u_instr || $is_j_instr || $is_s_instr || $is_b_instr;
         ?$opcode_valid
            $opcode[6:0] = $instr[6:0];
         
-------------------------------------------------------
///////////////////////////////////////////////////////////////
////////////////Lab: Register File Read/////////////
///////////////////////////////////////////////////////////////
https://myth2.makerchip.com/sandbox/04xfJhBGq/0j2hn9B#
------------------------------------------------------
// Lab: Register File Read
         $rf_rd_data1[31:0] = (!$reset && $rf_rd_en1 && !$rf_wr_en && $rd_valid) ?
                              0 : $rf_wr_data[31:0];
         $rf_rd_data2[31:0] = (!$reset && $rf_rd_en2 && !$rf_wr_en && $rd_valid) ?
                              0 : $rf_wr_data[31:0];
 // Part-2 Register File Read
         $src1_value[31:0] = $rf_rd_data1[31:0] ;
         $src2_value[31:0] = $rf_rd_data2[31:0] ;
------------------------------------------------------------------------
-----------------------------------------------------------
///////////////////////////////////////////////////////////////
///////////////LAB : ALU and Register File Write////////////
///////////////////////////////////////////////////////////////
https://myth2.makerchip.com/sandbox/04xfJhBGq/0k5hONJ#
-------------------------------------------------------
    
      // LAB : ALU
         $result[31:0] = $is_addi ? $src1_value + $imm :
                         $is_add ? $src1_value + $imm :
                         32'bx;
      // Lab: Register File Write
         $rf_wr_data1[31:0] = (!$reset && !$rf_rd_en1 && $rf_rd_en2 && $rf_wr_en && $rd_valid ) ?
                               >>1$rf_rd_data1[31:0] : $rf_rd_data1[31:0]
                               ;
         $rf_wr_data1[31:0] = (!$reset && $rf_rd_en1 && !$rf_rd_en2 && $rf_wr_en && $rd_valid ) ?
                               >>1$rf_rd_data2[31:0] : $rf_rd_data2[31:0]
                               ;
                              
------------------------------------------------------------
///////////////////////////////////////////////////////////////
////////////////Lab: Branch LAb/////////////////////
///////////////////////////////////////////////////////////////
https://myth2.makerchip.com/sandbox/04xfJhBGq/0oYhrMD#
---------------------------------------------------------------
 // Lab: Branches
         $taken_br = ($src1_value == $src2_value) ? $is_beq :
                         ($src1_value != $src2_value) ? $is_bne :
                         ($src1_value < $src2_value )^($src1_value[31] != $src2_value[31]) ? $is_blt :
                         ($src1_value >= $src2_value)^($src1_value[31] != $src2_value[31])  ? $is_bge :
                         ($src1_value < $src2_value) ? $is_bltu :
                         ($src1_value >= $src2_value) ? $is_bgeu : 11'b0;
         $br_tgt_pc = $pc +$imm ;

-----------------------------------------------------------------
/////////////////////////////////////////////////////////////////////
/////////////// LAB- TEST BENCH//////////////////////////////////
////////////////////////////////////////////////////////////////////////
https://myth2.makerchip.com/sandbox/0ADf9h9Kr/0AnhNgp#
-----------------------------------------------------------------
   // Lab Testbench
   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *passed = |cpu/xreg[10]>>5$value == (1+2+3+4+5+6+7+8+9);
   *failed = 1'b0;

------------------------------------------------------------
/////////////// DAY-4_complete_bug-free-code/////////////////////////////////
////////////////////////////////////////////////////////////////////////
https://myth2.makerchip.com/sandbox/0ADf9h9Kr/098hk5M#
-------------------------------------------------------------------
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
         // LAB: New PC
         //$pc[31:0] = 32'b0;
         //$inc_pc[31:0] = 4 + $pc[31:0];
         $pc[31:0] = >>1$reset  ? 0:
                     >>1$taken_br ? >>1$br_tgt_pc :
                     >>1$pc[31:0]+32'd4;
      
         
      @1
         // LAB: Fetch
         $imem_rd_addr[M4_IMEM_INDEX_CNT-1:0] = $pc[M4_IMEM_INDEX_CNT+1:2];
         
         $imem_rd_en = !$reset;
         //read data from memory
         $instr[31:0] = $imem_rd_data[31:0];
         
         //Lab : Instruction Types Decode
         $is_i_instr = $instr[6:2] ==? 5'b0000x ||
                       $instr[6:2] ==? 5'b001x0 ||
                       $instr[6:2] ==? 5'b11001;
         $is_s_instr = $instr[6:2] ==? 5'b0100x ;
         $is_r_instr = $instr[6:2] ==? 5'b01011 ||
                       $instr[6:2] ==? 5'b011x0 ||
                       $instr[6:2] ==? 5'b01011 ;
         $is_u_instr = $instr[6:2] ==? 5'b0x101;
         $is_b_instr = $instr[6:2] ==? 5'b11000 ;
         $is_j_instr = $instr[6:2] ==? 5'b11011 ;
         $is_r4_instr = $instr[6:2] ==? 5'b1000x  || $instr[6:2] ==? 5'b1001x;
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
         //  RISC-V INSTRUCTION FIELD DECODE             
         $rs2_valid = $is_r_instr || $is_s_instr || $is_b_instr;
         ?$rs2_valid
            $rs2[4:0] = $instr[24:20];
         $rs1_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
         ?$rs1_valid
            $rs1[4:0] = $instr[19:15];
         $funct3_valid = $is_r_instr || $is_i_instr || $is_s_instr ;
         ?$funct3_valid
            $funct3[2:0] = $instr[14:12];
         $funct7_valid = $is_r_instr || $is_b_instr;
         ?$funct7_valid
            $funct7[6:0] = $instr[31:25];
         $rd_valid = $is_r_instr || $is_i_instr || $is_u_instr || $is_j_instr;
         ?$rd_valid
            $rd[4:0] = $instr[11:7];
            $rs2_valid = $is_r_instr || $is_s_instr || $is_b_instr;
         ?$rs2_valid
            $rs2[4:0] = $instr[24:20];
         $rs1_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
         ?$rs1_valid
            $rs1[4:0] = $instr[19:15];
         $funct3_valid = $is_r_instr || $is_i_instr || $is_s_instr ;
         ?$funct3_valid
            $funct3[2:0] = $instr[14:12];
         $funct7_valid = $is_r_instr || $is_b_instr;
         ?$funct7_valid
            $funct7[6:0] = $instr[31:25];
         $rd_valid = $is_r_instr || $is_i_instr || $is_u_instr || $is_j_instr;
         ?$rd_valid
            $rd[4:0] = $instr[11:7];
         
         /*$opcode_valid = $is_r_instr || $is_i_instr || $is_u_instr || $is_j_instr || $is_s_instr || $is_b_instr;
         ?$opcode_valid*/
         $opcode[6:0] = $instr[6:0];
         // Lab: Instruction Decode  
         $dec_bits[10:0] = {$funct7[5],$funct3,$opcode};
         
         $is_beq = $dec_bits ==? 11'bx_000_1100011 ;
         $is_bne = $dec_bits ==? 11'bx_001_1100011 ;
         $is_blt = $dec_bits ==? 11'bx_100_1100011 ;
         $is_bge = $dec_bits ==? 11'bx_101_1100011 ;
         $is_bltu = $dec_bits ==? 11'bx_110_1100011 ;
         $is_bgeu = $dec_bits ==? 11'bx_111_1100011 ;
         $is_addi = $dec_bits ==? 11'bx_000_0010011 ;
         $is_add = $dec_bits ==? 11'bx_000_0110011 ;
         `BOGUS_USE($is_beq $is_bne $is_blt $is_bge $is_bltu $is_bgeu $is_addi $is_add)
         
         // Lab: Register File Read
         
         $rf_wr_en = $rd_valid && $rd != 5'b0;
         $rf_wr_index[4:0] = $rd[4:0];
         $rf_rd_index1[4:0] = $rs1[4:0];
         $rf_rd_index2[4:0] = $rs2[4:0];
         $rf_rd_en1 = $rs1_valid;
         $rf_rd_en2 = $rs2_valid;
         
         ?$rf_rd_en1
            $rf_rd_data1[31:0] = /xreg[$rf_rd_index1]>>1$value;
         ?$rf_rd_en2
            $rf_rd_data2[31:0] = /xreg[$rf_rd_index2]>>1$value;
         // Part-2 Register File Read
         $src1_value[31:0] = $rf_rd_data1[31:0] ;
         $src2_value[31:0] = $rf_rd_data2[31:0] ;
         // LAB : ALU
         $result[31:0] = $is_addi ? $src1_value + $imm :
                         $is_add ? $src1_value + $src2_value :
                         32'bx;
         // Lab: Register File Write
         $rf_wr_data[31:0] = $result[31:0];
         
         // Lab: Branches 
         $taken_br = ($src1_value == $src2_value) ? $is_beq :
                         ($src1_value != $src2_value) ? $is_bne :
                         ($src1_value < $src2_value )^($src1_value[31] != $src2_value[31]) ? $is_blt :
                         ($src1_value >= $src2_value)^($src1_value[31] != $src2_value[31])  ? $is_bge :
                         ($src1_value < $src2_value) ? $is_bltu :
                         ($src1_value >= $src2_value) ? $is_bgeu : 11'b0;
         $br_tgt_pc = $pc +$imm ;
         
         // Lab Testbench
         
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *passed = |cpu/xreg[10]>>5$value == (1+2+3+4+5+6+7+8+9);
   *failed = 1'b0;
   
   // Macro instantiations for:
   //  o instruction memory
   //  o register file
   //  o data memory
   //  o CPU visualization
   |cpu
      m4+imem(@1)    // Args: (read stage)
      m4+rf(@1, @1)  // Args: (read stage, write stage) - if equal, no register bypass is required
      //m4+dmem(@4)    // Args: (read/write stage)
   
   m4+cpu_viz(@4)    // For visualisation, argument should be at least equal to the last stage of CPU logic
                       // @4 would work for all labs
\SV
   endmodule

----------------------------------------------------------------------------------------------------------
///////////////////////////////////////////////////////////////////////////////////////
///////////////////////DAY-5-UP-TO-SLIDE-NUMBER-45/////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
--------------------------------------------------------------------------
https://myth2.makerchip.com/sandbox/0ADf9h9Kr/0X6hX9k#
------------------------------------------------------------------------
\m4_TLV_version 1d: tl-x.org
\SV

   // ==========================================
   // For use in Makerchip for the MYTH Workshop
   // Provides reference solutions
   // without visibility to source code.
   // ==========================================
   
   // ----------------------------------
   // Instructions:
   //    - When stuck on a particular lab, configure code below,
   //      and compile/simulate.
   //    - A reference solution will build, but the source code will not be visible.
   //    - You may use waveforms, diagrams, and visualization to understand the proper circuit, but you
   //      will have to come up with the code. Logic expression syntax can be found by hovering over the
   //      signal assignment in the diagram.
   //    - Also reference https://github.com/stevehoover/RISC-V_MYTH_Workshop/blob/master/README.md
   //      for updated information during the workshop as well as live support links.
   // ----------------------------------
   

   // =============
   // Configuration
   // =============
   
   // For RISC-V solutions, comment the line below.
   //m4_define(['M4_CALCULATOR'], 1)
   // Provide a slide number for the lab.
   m4_define(['M4_SLIDE_NUM'], 42)



   // Default Makerchip TL-Verilog Code Template
   m4_include_makerchip_hidden(['myth_workshop_solutions.private.tlv'])

   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   m4+solution(M4_SLIDE_NUM)
   // The stage that is represented by visualization.
   m4+cpu_viz(@4)
\SV
   endmodule

/*

Labs slide #, for reference

----- Calculator Labs ------

Slide  Lab
-----  ---
23     Sequential Calculator
35     Counter and Calculator in Pipeline
36     2-Cycle Calculator
41     2-Cycle Calculator with Validity
43     Calculator with Single-Value Memory

----- RISC-V Labs ----------

Slide    Lab 
-----    ---                     

D4SK2
-----
6      [Not supported] Next PC                                
7      Fetch (part 1)
8      Fetch (part 2)
10     Instruction Types Decode and Immediate Decode
11     Instruction Decode
12     RISC-V Instruction Field Decode
13     Instruction Decode

D4SK3
-----
16     Register File Read
17     Register File Read (part 2)
18     ALU
20     Register File Write
21     Branches 1
22     Branches 2
25     Testbench

D5SK1
-----  
33     3-Cycle valid
36     3-Cycle RISC-V 1
37     3-Cycle RISC-V 2

D5SK2
-----  
39     Register File Bypass
42     Branches
44     Complete Instruction Decode
45     Complete ALU

D5SK3
-----  
48     Redirect Loads
49     Load Data 1
51     Load Data 2
52     Load/Store in Program
53     Jumps

 *********************************/

----------------------------------------------------------------------------
//////////////////////////////////////////////
/////////////DAY-5///////FINAL-CODE/////////////
//////////////////////////////////////////////
https://myth2.makerchip.com/sandbox/0v2fWhzmz/0nZh7V8#
------------------------------------------------------------------------
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
   //m4_asm(SW, r0, r10, 10000)
   //m4_asm(LW, r17, r0, 10000)
   // Optional:
   // m4_asm(JAL, r7, 00000000000000000000) // Done. Jump to itself (infinite loop). (Up to 20-bit signed immediate plus implicit 0 bit (unlike JALR) provides byte address; last immediate bit should also be 0)
   m4_define_hier(['M4_IMEM'], M4_NUM_INSTRS)
/////////////DAY-5///////FINAL-CODE/////////////
   |cpu
      @0
         $reset = *reset;
         $inc_pc[31:0] = $pc[31:0] + 4;
         $pc[31:0] = >>1$reset ? 0 : >>3$valid_taken_br ?
                    >>3$br_tgt_pc : >>3$valid_ld ? >>3$inc_pc[31:0] : 
                    >>3$valid_jump && >>3$is_jal ?
                    >>3$br_tgt_pc :
                    >>3$valid_jump && >>3$is_jalr ?
                    >>3$jglr_tgt_pc :
                    >>1$inc_pc[31:0]; 
      
      @1
         $imem_rd_addr[M4_IMEM_INDEX_CNT-1:0] = $pc[M4_IMEM_INDEX_CNT+1:2];
         
         $imem_rd_en = !$reset;
         //read data from memory////////////////////////////
         $instr[31:0] = $imem_rd_data[31:0];
         
         //Lab : Instruction Types Decode///////////////////////////////////
         $is_i_instr = $instr[6:2] ==? 5'b0000x ||
                       $instr[6:2] ==? 5'b001x0 ||
                       $instr[6:2] ==? 5'b11001;
         $is_s_instr = $instr[6:2] ==? 5'b0100x ;
         $is_r_instr = $instr[6:2] ==? 5'b01011 ||
                       $instr[6:2] ==? 5'b011x0 ||
                       $instr[6:2] ==? 5'b01011 ;
         $is_u_instr = $instr[6:2] ==? 5'b0x101;
         $is_b_instr = $instr[6:2] ==? 5'b11000 ;
         $is_j_instr = $instr[6:2] ==? 5'b11011 ;
         $is_r4_instr = $instr[6:2] ==? 5'b1000x  || $instr[6:2] ==? 5'b1001x;
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
         //  RISC-V INSTRUCTION FIELD DECODE  ///////////////////////////////////////           
         $rs2_valid = $is_r_instr || $is_s_instr || $is_b_instr;
         ?$rs2_valid
            $rs2[4:0] = $instr[24:20];
         $rs1_valid = $is_r_instr || $is_i_instr || $is_s_instr || $is_b_instr;
         ?$rs1_valid
            $rs1[4:0] = $instr[19:15];
         $funct3_valid = $is_r_instr || $is_i_instr || $is_s_instr ;
         ?$funct3_valid
            $funct3[2:0] = $instr[14:12];
         $funct7_valid = $is_r_instr || $is_b_instr;
         ?$funct7_valid
            $funct7[6:0] = $instr[31:25];
         $rd_valid = $is_r_instr || $is_i_instr || $is_u_instr || $is_j_instr;
         ?$rd_valid
            $rd[4:0] = $instr[11:7];
         
         $opcode_valid = $is_r_instr || $is_i_instr || $is_u_instr || $is_j_instr || $is_s_instr || $is_b_instr;
         ?$opcode_valid*/
            $opcode[6:0] = $instr[6:0];

      @2
         // Lab: Instruction Decode  
         $dec_bits[10:0] = {$funct7[5],$funct3,$opcode};
         $is_ld = $dec_bits ==? 7'b0000011;
         $is_lui = $dec_bits ==? 11'bx_xxx_0110111 ;
         $is_auipc = $dec_bits ==? 11'bx_xxx_0010111 ;
         $is_jal = $dec_bits ==? 11'bx_xxx_1101111 ;
         //////////////////////////////////////////////////////
         $is_jalr = $dec_bits ==? 11'bx_000_0110011 ;
         $is_beq = $dec_bits ==? 11'bx_000_1100011 ;
         $is_bne = $dec_bits ==? 11'bx_001_1100011 ;
         $is_blt = $dec_bits ==? 11'bx_100_1100011 ;
         $is_bge = $dec_bits ==? 11'bx_101_1100011 ;
         $is_bltu = $dec_bits ==? 11'bx_110_1100011 ;
         $is_bgeu = $dec_bits ==? 11'bx_111_1100011 ;
         ///////////////////////////////////////////////////
         $is_load = $dec_bits ==? 11'bx_xxx_0000011 ;
         ///////////////////////////////////////////////////
         $is_sb = $dec_bits ==? 11'bx_000_0100011 ;
         $is_sh = $dec_bits ==? 11'bx_001_0100011 ;
         $is_sw = $dec_bits ==? 11'bx_010_0100011 ;
         /////////////////////////////////////////
         $is_addi = $dec_bits ==? 11'bx_000_0010011 ;  
         $is_slti = $dec_bits ==? 11'bx_010_0010011 ;
         $is_sltiu = $dec_bits ==? 11'bx_011_0010011 ;
         $is_xori = $dec_bits ==? 11'bx_100_0010011 ;
         $is_ori = $dec_bits ==? 11'bx_110_0010011 ;
         $is_andi = $dec_bits ==? 11'bx_111_0010011 ;
         $is_slli = $dec_bits ==? 11'b0_001_0010011 ;
         $is_srli = $dec_bits ==? 11'b0_101_0010011 ;
         $is_srai = $dec_bits ==? 11'b1_101_0010011 ;
         /////////////////////////////////////////////////
         $is_add = $dec_bits ==? 11'b0_000_0110011 ;
         $is_sub = $dec_bits ==? 11'b1_000_0110011 ;
         $is_sll = $dec_bits ==? 11'b0_001_0110011 ;
         $is_slt = $dec_bits ==? 11'b0_010_0110011 ;
         $is_sltu = $dec_bits ==? 11'b0_011_0110011 ;
         $is_xor = $dec_bits ==? 11'b0_100_0110011 ;
         $is_srl = $dec_bits ==? 11'b0_101_0110011 ;
         $is_sra = $dec_bits ==? 11'b1_101_0110011 ;
         $is_or = $dec_bits ==? 11'b0_011_0110011 ;
         $is_and = $dec_bits ==? 11'b0_111_0110011 ;
         `BOGUS_USE($is_lui $is_auipc $is_jal $is_jalr $is_beq $is_bne $is_blt $is_bge $is_bltu $is_bgeu $is_load $is_sb $is_sh $is_sw $is_addi $is_add $is_slti $is_sltu $is_xori $is_ori $is_andi $is_slli $is_srli $is_srai $is_add $is_sub $is_sll $is_slt $is_sltu $is_xor $is_srl $is_sra $is_or $is_and) 
         //////////////////////////////////////////////////
          // Lab: Register File Read
         
         
         $rf_rd_index1[4:0] = $rs1[4:0];
         $rf_rd_index2[4:0] = $rs2[4:0];
         $rf_rd_en1 = $rs1_valid;
         $rf_rd_en2 = $rs2_valid;
         
         ////////////////////////////////////////////////////////
         $src1_value[31:0] = (>>1$rf_wr_en && (>>1$rf_wr_index == >>1$rf_rd_index1)) ? $rf_rd_data1[31:0]  : >>1$result; 
         $src2_value[31:0] = (>>1$rf_wr_en && (>>1$rf_wr_index == >>1$rf_rd_index2)) ? $rf_rd_data2[31:0] : >>1$result;
         ////////////////ADDITIONAL SIGNALS AND ARRAYS/////////////////////////////////////////
         $temp_u_result = ($src1_value < $src2_value); //created for s-instruction
         $temp_i_result = ($src1_value < $imm); //created for s-instruction
         $br_tgt_pc[31:0] = $pc[31:0] + $imm[31:0];
         $jglr_tgt_pc[3:0] = $src1_value +$imm;
      @3
         $valid_taken_br = $valid && $taken_br;
         $valid_ld = $valid && $is_load;
         $valid = !(>>1$valid_taken_br) || !(>>2$valid_taken_br) || 
                  (>>1$valid_ld) || (>>2$valid_ld);
         $is_jump = $is_jal || $is_jalr;
         $valid_jump = $is_jump && $valid;
         
         ////////////////////////////////////////////////////
         $temp_u_status = ($src1_value < $src2_value);
         
         $temp_i_status = ($src1_value < $imm);
         ////////////////////////////////////////////////
         $rf_wr_en = $rd_valid && (!$rd == 5'b0) && $valid; //DAY-5 
         $rf_wr_index[4:0] = >>2$valid_ld ? >>2$rd : $rd;
         $rf_wr_data[31:0] = >>2$valid_ld ? >>2$load_data[31:0] : $result;
         $taken_br = ($is_beq && ($src1_value == $src2_value)) ? 1 :
                     ($is_bne && ($src1_value != $src2_value)) ? 1 :
                     ($is_blt && ($src1_value < $src2_value) ^($src1_value[31] != $src2_value[31])) ? 1 :
                     ($is_bge && ($src1_value >= $src2_value)^($src1_value[31] != $src2_value[31])) ? 1 :
                     ($is_bltu &&($src1_value < $src2_value))  ? 1 :
                     ($is_bgeu && ($src1_value > $src2_value)) ? 1 :
                     ($is_andi && ($src1_value & $imm)) ? 1 :
                     ($is_xori && ($src1_value ^ $imm)) ? 1 :
                     ($is_ori && ($src1_value | $imm)) ? 1 :
                     ($is_addi && ($src1_value + $imm)) ? 1 :
                     ($is_slli && ($src1_value + $imm[5:0])) ? 1 :
                     ($is_srli && ($src1_value + $imm[5:0])) ? 1 :
                     ($is_and && ($src1_value & $src2_value)) ? 1 :
                     ($is_or && ($src1_value | $src2_value)) ? 1 :
                     ($is_xor && ($src1_value ^ $src2_value)) ? 1 :
                     ($is_add && ($src1_value + $src2_value)) ? 1 :
                     ($is_sub && ($src1_value - $src2_value)) ? 1 :
                     ($is_sll && ($src1_value << $src2_value[4:0])) ? 1 :
                     ($is_srl && ($src1_value >> $src2_value[4:0])) ? 1 :
                     ($is_sltu && ($src1_value < $src2_value)) ? 1 :
                     ($is_sltiu && ($src1_value < $imm)) ? 1 :
                     ($is_lui && {$imm[31:12],12'b0})? 1 :
                     ($is_auipc && ($pc +$imm))? 1 :
                     ($is_jal && ($pc + 4 ))? 1 :
                     ($is_jalr && ($pc + 4 ))? 1 :
                     ($is_srai && {{32{$src1_value[31]}},$src1_value} >> $imm[4:0]) ? 1 :
                     ($is_slt && ($src1_value[31] == $src2_value[31]) ? $temp_u_result : {31'b0, $src1_value[31]}) ? 1 :
                     ($is_slti && ($src1_value[31] == $imm[31]) ? $temp_u_result : {31'b0, $src1_value[31]}) ? 1 :
                     ($is_sra && {{32{$src1_value[31]}}, $src1_value} >> $src2_value[4:0]) ? 1 : 0;
         $result[31:0] =
             $is_addi  ? $src1_value + $imm[31:0] :
             $is_add   ? $src1_value + $src2_value :
             $is_beq ? ($src1_value == $src2_value)   :
             $is_bne ? ($src1_value != $src2_value)   :
             $is_blt ? ($src1_value < $src2_value) ^($src1_value[31] != $src2_value[31])   :
             $is_bge ? ($src1_value >= $src2_value)^($src1_value[31] != $src2_value[31])   :
             $is_bltu ? ($src1_value < $src2_value)   :
             $is_bgeu ? ($src1_value > $src2_value)   :
             $is_andi ? ($src1_value & $imm)   :
             $is_xori ? ($src1_value ^ $imm)   :
             $is_ori ? ($src1_value | $imm)  :
             $is_addi ? ($src1_value + $imm)   :
             $is_slli ? ($src1_value + $imm[5:0])   :
             $is_srli ? ($src1_value + $imm[5:0])   :
             $is_and ? ($src1_value & $src2_value)   :
             $is_or ? ($src1_value | $src2_value)   :
             $is_xor ? ($src1_value ^ $src2_value)  :
             $is_add ? ($src1_value + $src2_value)   :
             $is_sub ? ($src1_value - $src2_value)   :
             $is_sll ? ($src1_value << $src2_value[4:0])   :
             $is_srl ? ($src1_value >> $src2_value[4:0])   :
             $is_sltu ? $temp_u_status  :
             $is_sltiu ? $temp_i_status   :
             $is_lui ? {$imm[31:12],12'b0}  :
             $is_auipc ? ($pc +$imm)  :
             $is_jal ? ($pc + 4 ) :
             $is_jalr ? ($pc + 4)  :
             $is_srai ? {{32{$src1_value[31]}},$src1_value} >> $imm[4:0] :
             $is_slt ? ($src1_value[31] == $src2_value[31]) ? $temp_u_status : 
             {31'b0, $src1_value[31]} :
             $is_slti ? ($src1_value[31] == $imm[31]) ? $temp_i_status : {31'b0, $src1_value[31]} :
              
             //$is_sra ? {{32{$src1_value[31]}, $src1_value} >> $src2_value[4:0] : 
             32'bx;
         
      @4
         
         $dmem_rd_en = $is_s_instr && $valid;
         $dmem_wr_en = $is_ld;
         $dmem_addr[3:0] = $result[5:2];
         $dmem_wr_data[31:0] = $src2_value;
         $load_data[31:0] = $dmem_rd_data[31:0];
         
       
       // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *passed = |cpu/xreg[17]>>5$value == (0+1+2+3+4+5+6+7+8+9);
   *failed = 1'b0;

   

   
   // Macro instantiations for:
   //  o instruction memory
   //  o register file
   //  o data memory
   //  o CPU visualization
   |cpu
      m4+imem(@1)    // Args: (read stage)
      m4+rf(@2, @3)  // Args: (read stage, write stage) - if equal, no register bypass is required
      m4+dmem(@4)    // Args: (read/write stage)
   
   m4+cpu_viz(@4)    // For visualisation, argument should be at least equal to the last stage of CPU logic
                       // @4 would work for all labs
       // @4 would work for all labs
\SV
   endmodule
-----------------------------------------------------------------------------------------------------



--------------------------------------------------

