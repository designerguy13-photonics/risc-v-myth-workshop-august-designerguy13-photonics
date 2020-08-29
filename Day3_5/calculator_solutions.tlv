\m4_TLV_version 1d: tl-x.org
\SV
//Calculator labs solutions here

 // Lab : Counter ///////////////////////////
 https://myth2.makerchip.com/sandbox/0NkfNhjqj/0wjhGO1
 ----------------------------------------------------------------
  $cnt[3:0] = $reset ? 0 : (>>1$cnt + 1);
  -----------------------------------------------------------------------
 // Lab: Combinational Calculator ////////////////////////////////
 --------------------------------------------------------------------------
 https://myth2.makerchip.com/sandbox/0NkfNhjqj/0j2hn6p#
 ----------------------------------------------------------------------
 \m4_TLV_version 1d: tl-x.org
\SV
   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
   
   m4_include_lib(['https://raw.githubusercontent.com/stevehoover/RISC-V_MYTH_Workshop/bd1f186fde018ff9e3fd80597b7397a1c862cf15/tlv_lib/calculator_shell_lib.tlv'])

\SV
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)

\TLV
   |calc
      @0
         $reset = *reset;
         
         
         // YOUR CODE HERE
         $sum[31:0] = $val1[31:0] + $val2[31:0];
         $diff[31:0] = $val1[31:0] - $val2[31:0];
         $prod[31:0] = $val1[31;0] * $val2[31:0];
         $quot[31:0] = $val1[31:0] / $val2[31:0];
         
         $out[31:0] = $op[0] ? $sum[31:0] : ($op[1] ? $diff[31:0] : ($op[2] ? $prod[31:0] : $quot[31:0]));
         

      // Macro instantiations for calculator visualization(disabled by default).
      // Uncomment to enable visualisation, and also,
      // NOTE: If visualization is enabled, $op must be defined to the proper width using the expression below.
      //       (Any signals other than $rand1, $rand2 that are not explicitly assigned will result in strange errors.)
      //       You can, however, safely use these specific random signals as described in the videos:
      //  o $rand1[3:0]
      //  o $rand2[3:0]
      //  o $op[x:0]
      
   //m4+cal_viz(@3) // Arg: Pipeline stage represented by viz, should be atleast equal to last stage of CALCULATOR logic.

   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
   

\SV
   endmodule
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////log data/////////////////////////////////////////

INFORM(0) (PROD_INFO):
	SandPiper(TM) 1.9-2018/02/11-beta from Redwood EDA
	(DEV) Run as: "java -jar /src/sandpiper.jar --ide --licenseFile /src/full_license_key.txt --iArgs --distroRef=NO_DISTRO --debugSigs --viz --dhtml --stats --compiler verilator -i top.m4 -o top.sv
	For help, including product info, run with -h.

INFORM(0) (LICENSE):
	Licensed to "Redwood EDA" as: Full Edition.

INFORM(0) (FILES):
	From directory: /projects/Krf7xw
	Reading "top.m4" to produce:
		Translated HDL File: "top.sv"
		Generated HDL File: "top_gen.sv"
		HTML TLX File: "top.html"
		Simulation Visualization File: "top_viz.json"
		Statistics Directory: "top_stats"

WARNING(1) (FILE): File 'top.tlv' Line 41 (char 1)
	Preprocessed as 'top.m4':41(ch1):
	+v----------------------------------------
	>   \source ./mythworkshopsolutions.private.tlv 8   // Instantiated from top.tlv, 41 as: m4+solution(M4_SLIDE_NUM)
	+^----------------------------------------
	Error writing to file "Stats TLX HTML File": Refusing to produce output containing content from a .private.tlv file.

INFORM(0) (STATS):
	SandPiper generated 96% of your HDL code.
	This includes: 66 signal declarations, 20 flops/latches, and 3 conditional clock signals.
	View "top_stats" for more details.

WARNING(1) (FILE): File 'top.tlv' Line 41 (char 1)
	Preprocessed as 'top.m4':41(ch1):
	+v----------------------------------------
	>   \source ./mythworkshopsolutions.private.tlv 8   // Instantiated from top.tlv, 41 as: m4+solution(M4_SLIDE_NUM)
	+^----------------------------------------
	Error writing to file "top.html": Refusing to produce output containing content from a .private.tlv file.

SandPiper returning status 1.
verilator --debug --debugi 0 --gdbbt --no-dump-tree -V
No stack.
Starting Verilator 4.027 devel rev v4.026-36-g22088c9
Starting Verilator 4.027 devel rev v4.026-36-g22088c9
Verilator 4.027 devel rev v4.026-36-g22088c9

Copyright 2003-2020 by Wilson Snyder.  Verilator is free software; you can
redistribute it and/or modify the Verilator internals under the terms of
either the GNU Lesser General Public License Version 3 or the Perl Artistic
License Version 2.0.

See https://verilator.org for documentation

Summary of configuration:
  Compiled in defaults if not in environment:
    SYSTEMC            = 
    SYSTEMC_ARCH       = 
    SYSTEMC_INCLUDE    = 
    SYSTEMC_LIBDIR     = 
    VERILATOR_ROOT     = /usr/local/share/verilator

Environment:
    PERL               = 
    SYSTEMC            = 
    SYSTEMC_ARCH       = 
    SYSTEMC_INCLUDE    = 
    SYSTEMC_LIBDIR     = 
    VERILATOR_ROOT     = 
    VERILATOR_BIN      = 
[Inferior 1 (process 12424) exited normally]
No stack.
verilator --debug --debugi 0 --gdbbt --no-dump-tree --cc +librescan +libext+.sv --top-module makerchip -y . -y /src/verilog -y /src/sandhost -y /src/proj_default -y /src/lib +incdir+. +incdir+./sv_url_inc +incdir+/src/verilog +incdir+/src/sandhost +incdir+/src/proj_default +incdir+/src/lib makerchip.sv --assert --trace
No stack.
Starting Verilator 4.027 devel rev v4.026-36-g22088c9
Starting Verilator 4.027 devel rev v4.026-36-g22088c9
[Inferior 1 (process 12439) exited normally]
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
Krf7xw
/top
|calc
@1
@2
@3
@4
@0
/mem_array[7:0]
@1
@2
$diff=
$mem=
$op=
$out=
$prod=
$quot=
$rand2=
$reset=
$reset_
or_
valid=
$sum=
$val1=
$val2=
$valid=
$value=
$wr=
*cyc_cnt
*failed
*passed
*reset
/////////////////////////////////////////////////////////////////////////////////////
-------------------LAB: SEQUENTIAL CALC-------------------------------------
https://myth2.makerchip.com/sandbox/0NkfNhjqj/0pghnlW
/////////////////////////////////////////////////////////////////////////////////

ADD THE FOLLOWING CODE:

\TLV
   |calc
      @0
         $reset = *reset;
         
         $sum[31:0] = $val1[31:0] + $val2[31:0];
         
         $diff[31:0] = $val1[31:0] - $val2[31:0];
         
         $prod[31:0]  = $val1[31:0] * $val2[31:0];
         
         $quot[31:0] = $val1[31:0] / $val2[31:0];
         // YOUR CODE HERE
         $out[31:0] = $op[0] ? 
                      $sum[31:0] :
                      ($op[1] ?
                      $diff[31:0] :
                      ($op[2] ?
                      $prod[31:0] :
                      $quot[31:0])
                      );
         $val1[31:0] = $reset ? 1 :(>>1$out[31:0]);
//////////////////////////////////////////////////////////////
------------LOG-------------------------------------------------
[Inferior 1 (process 32614) exited normally]
No stack.
verilator --debug --debugi 0 --gdbbt --no-dump-tree --cc +librescan +libext+.sv --top-module makerchip -y . -y /src/verilog -y /src/sandhost -y /src/proj_default -y /src/lib +incdir+. +incdir+./sv_url_inc +incdir+/src/verilog +incdir+/src/sandhost +incdir+/src/proj_default +incdir+/src/lib makerchip.sv --assert --trace
No stack.
Starting Verilator 4.027 devel rev v4.026-36-g22088c9
Starting Verilator 4.027 devel rev v4.026-36-g22088c9
[Inferior 1 (process 32661) exited normally]
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////LAB : PIPELINE/////////////////////////////////////////////////
https://myth2.makerchip.com/sandbox/0NkfNhjqj/0mwhj0l
--------------------------------------------------------------------------
   |calc
      @0   
        // YOUR CODE HERE
        $err1 = $bad_input || $illegal_op ;
      @3 
        $err2 = $over_flow || $err1 ;
      @6 
        $err3 = $div_by_zero || $err2 ;
         
----------------------------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////
///////Lab : Counter and Calculator in Pipeline//////////////////////////////////
----------------------------------------------------------------------------
https://myth2.makerchip.com/sandbox/0NkfNhjqj/0DRh5g5#
//////////////////////////////////////////////////////////////////////
///////LAB-2-CYCLE-CALCULATOR/////////////////////////////////////
https://myth2.makerchip.com/sandbox/0NkfNhjqj/0KOh23r#
----------------------------------------------------------------------
\m4_TLV_version 1d: tl-x.org
\SV
   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
   
   m4_include_lib(['https://raw.githubusercontent.com/stevehoover/RISC-V_MYTH_Workshop/bd1f186fde018ff9e3fd80597b7397a1c862cf15/tlv_lib/calculator_shell_lib.tlv'])

\SV
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)

\TLV
   |calc
      @0         
        $reset = *reset;
        
      @1   
        // YOUR CODE HERE
        //Calculator
      
        
         // Change allignment of the output 
         $val1[31:0] = >>2$out[31:0];
         //Set ALU operation
         $sum[31:0]  = $val1[31:0] + $val2[31:0];         
         $diff[31:0] = $val1[31:0] - $val2[31:0];        
         $prod[31:0] = $val1[31:0] * $val2[31:0];         
         $quot[31:0] = $val1[31:0] / $val2[31:0];
         //counter
         $valid = $reset ? 1 : (>>1$valid + 1);
         
      @2   
         
         //Mux Logic timed to stage 2
         
                  
         $ctrl = $reset || (!$valid) ;
         $out[31:0] = $ctrl == 2'b00 ? 
                      $sum[31:0] : $ctrl == 2'b01 ?
                      $diff[31:0] : $ctrl == 2'b10 ? 
                      $prod[31:0] : $ctrl == 2'b11 ?
                      $quot[31:0] : 32'b0;
       
        
         
         
         
      // Macro instantiations for calculator visualization(disabled by default).
      // Uncomment to enable visualisation, and also,
      // NOTE: If visualization is enabled, $op must be defined to the proper width using the expression below.
      //       (Any signals other than $rand1, $rand2 that are not explicitly assigned will result in strange errors.)
      //       You can, however, safely use these specific random signals as described in the videos:
      //  o $rand1[3:0]
      //  o $rand2[3:0]
      //  o $op[x:0]
      
   //m4+cal_viz(@3) // Arg: Pipeline stage represented by viz, should be atleast equal to last stage of CALCULATOR logic.

   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
   

\SV
   endmodule
//////////////////////////////////////////////////////////////////////////////
///////////LAB-2-CYCLE-CALCULATOR WITH VALIDITY/////////////////////
https://myth2.makerchip.com/sandbox/0NkfNhjqj/0wjhGY1#
--------------------------------------------------------------------
\m4_TLV_version 1d: tl-x.org
\SV
   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
   
   m4_include_lib(['https://raw.githubusercontent.com/stevehoover/RISC-V_MYTH_Workshop/bd1f186fde018ff9e3fd80597b7397a1c862cf15/tlv_lib/calculator_shell_lib.tlv'])

\SV
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)

\TLV
   |calc
      @0         
         $reset = *reset;
      ?$valid_or_reset
         @1
           
           // YOUR CODE HERE
           //Calculator              
           // Change allignment of the output 
           $valid_or_reset = $valid || $reset;
           $val2[31:0] = $rand2[31:0];
           $val1[31:0] = >>2$out[31:0];
           //Set ALU operation
           $sum[31:0]  = $val1[31:0] + $val2[31:0];         
           $diff[31:0] = $val1[31:0] - $val2[31:0];        
           $prod[31:0] = $val1[31:0] * $val2[31:0];         
           $quot[31:0] = $val1[31:0] / $val2[31:0];
           //counter
           $valid = $reset ? 1 : (>>1$valid + 1);
         
         @2   
         
           $out[31:0] = $valid_or_reset ? 32'b0 : 
                      
                      ($ctrl[0] ? 
                      ($ctrl[1] ?
                      $diff[31:0] : $quot[31:0] )
                      : ($ctrl[1] ? 
                      $sum[31:0] : $prod[31:0]))
                      ;
       
        
                  
      // Macro instantiations for calculator visualization(disabled by default).
      // Uncomment to enable visualisation, and also,
      // NOTE: If visualization is enabled, $op must be defined to the proper width using the expression below.
      //       (Any signals other than $rand1, $rand2 that are not explicitly assigned will result in strange errors.)
      //       You can, however, safely use these specific random signals as described in the videos:
      //  o $rand1[3:0]
      //  o $rand2[3:0]
      //  o $op[x:0]
      
   //m4+cal_viz(@3) // Arg: Pipeline stage represented by viz, should be atleast equal to last stage of CALCULATOR logic.

   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
   

\SV
   endmodule

------------------------------------------------------------------------------
//////////////////////////////////////////////////////////////////
///////////LAB-2-CYCLE-CALCULATOR WITH SINGLE MEMORY/////////////////////

https://myth2.makerchip.com/sandbox/0rkfAh4pA/0Vmhx91
-----------------------------------------------------------------------------

INFORM(0) (PROD_INFO):
	SandPiper(TM) 1.9-2018/02/11-beta from Redwood EDA
	(DEV) Run as: "java -jar /src/sandpiper.jar --ide --licenseFile /src/full_license_key.txt --iArgs --distroRef=NO_DISTRO --debugSigs --viz --dhtml --stats --compiler verilator -i top.m4 -o top.sv
	For help, including product info, run with -h.

INFORM(0) (LICENSE):
	Licensed to "Redwood EDA" as: Full Edition.

INFORM(0) (FILES):
	From directory: /projects/xkf5jG
	Reading "top.m4" to produce:
		Translated HDL File: "top.sv"
		Generated HDL File: "top_gen.sv"
		HTML TLX File: "top.html"
		Simulation Visualization File: "top_viz.json"
		Statistics Directory: "top_stats"

SYNTAX_ERROR(3) (INDENT): File 'top.tlv' Line 19 (char 12)
	Preprocessed as 'top.m4':19(ch12):
	+-----------v-----------------------------
	|           
	|           // YOUR CODE HERE
	|           //Calculator              
	|           // Change allignment of the output 
	>           $valid_or_reset = $valid || $reset;
	+-----------^-----------------------------
	Indentation is 11 spaces, which is not a multiple of 3.  Interpretting as 12 spaces.

SYNTAX_ERROR(3) (INDENT): File 'top.tlv' Line 20 (char 12)
	Preprocessed as 'top.m4':20(ch12):
	+-----------v-----------------------------
	>           $val2[31:0] = $rand2[31:0];
	+-----------^-----------------------------
	Indentation is 11 spaces, which is not a multiple of 3.  Interpretting as 12 spaces.

SYNTAX_ERROR(3) (INDENT): File 'top.tlv' Line 21 (char 12)
	Preprocessed as 'top.m4':21(ch12):
	+-----------v-----------------------------
	>           $val1[31:0] = >>2$out[31:0];
	+-----------^-----------------------------
	Indentation is 11 spaces, which is not a multiple of 3.  Interpretting as 12 spaces.

SYNTAX_ERROR(3) (INDENT): File 'top.tlv' Line 23 (char 12)
	Preprocessed as 'top.m4':23(ch12):
	+-----------v-----------------------------
	|           //Set ALU operation
	>           $sum[31:0]  = $val1[31:0] + $val2[31:0];         
	+-----------^-----------------------------
	Indentation is 11 spaces, which is not a multiple of 3.  Interpretting as 12 spaces.

SYNTAX_ERROR(3) (INDENT): File 'top.tlv' Line 24 (char 12)
	Preprocessed as 'top.m4':24(ch12):
	+-----------v-----------------------------
	>           $diff[31:0] = $val1[31:0] - $val2[31:0];        
	+-----------^-----------------------------
	Indentation is 11 spaces, which is not a multiple of 3.  Interpretting as 12 spaces.

SYNTAX_ERROR(3) (INDENT): File 'top.tlv' Line 25 (char 12)
	Preprocessed as 'top.m4':25(ch12):
	+-----------v-----------------------------
	>           $prod[31:0] = $val1[31:0] * $val2[31:0];         
	+-----------^-----------------------------
	Indentation is 11 spaces, which is not a multiple of 3.  Interpretting as 12 spaces.

SYNTAX_ERROR(3) (INDENT): File 'top.tlv' Line 26 (char 12)
	Preprocessed as 'top.m4':26(ch12):
	+-----------v-----------------------------
	>           $quot[31:0] = $val1[31:0] / $val2[31:0];
	+-----------^-----------------------------
	Indentation is 11 spaces, which is not a multiple of 3.  Interpretting as 12 spaces.

SYNTAX_ERROR(3) (INDENT): File 'top.tlv' Line 28 (char 12)
	Preprocessed as 'top.m4':28(ch12):
	+-----------v-----------------------------
	|           //counter
	>           $valid = $reset ? 1 : (>>1$valid + 1);
	+-----------^-----------------------------
	Indentation is 11 spaces, which is not a multiple of 3.  Interpretting as 12 spaces.

LOGIC_ERROR(5) (CONDITION-CONTEXT): File 'top.tlv' Line 19 (char 12)
	Preprocessed as 'top.m4':19(ch12):
	+-----------v-----------------------------
	|           
	|           // YOUR CODE HERE
	|           //Calculator              
	|           // Change allignment of the output 
	>           $valid_or_reset = $valid || $reset;
	+-----------^-----------------------------
	Currently, signals used as 'when' conditions may not themselves be under a 'when' condition within their behavioral scope.

LOGIC_ERROR(5) (UNASSIGNED-SIG): File 'top.tlv' Line 31 (char 26)
	Preprocessed as 'top.m4':31(ch26):
	+-------------------------vvvvvvvvvv------
	>            $mem[31:0] = $ctrl[2:0] ? 0 : (>>1$out[31:0]);
	+-------------------------^^^^^^^^^^------
	Signal |calc$ctrl is used but never assigned.

LOGIC_ERROR(5) (UNASSIGNED-SIG): File 'top.tlv' Line 20 (char 26)
	Preprocessed as 'top.m4':20(ch26):
	+-------------------------vvvvvvvvvvvv----
	>           $val2[31:0] = $rand2[31:0];
	+-------------------------^^^^^^^^^^^^----
	Signal |calc$rand2 is used but never assigned.

INFORM(0) (STATS):
	SandPiper generated 73% of your HDL code.
	This includes: 28 signal declarations, 12 flops/latches, and 2 conditional clock signals.
	View "top_stats" for more details.

SandPiper returning status 5.
verilator --debug --debugi 0 --gdbbt --no-dump-tree -V
No stack.
Starting Verilator 4.027 devel rev v4.026-36-g22088c9
Starting Verilator 4.027 devel rev v4.026-36-g22088c9
Verilator 4.027 devel rev v4.026-36-g22088c9

Copyright 2003-2020 by Wilson Snyder.  Verilator is free software; you can
redistribute it and/or modify the Verilator internals under the terms of
either the GNU Lesser General Public License Version 3 or the Perl Artistic
License Version 2.0.

See https://verilator.org for documentation

Summary of configuration:
  Compiled in defaults if not in environment:
    SYSTEMC            = 
    SYSTEMC_ARCH       = 
    SYSTEMC_INCLUDE    = 
    SYSTEMC_LIBDIR     = 
    VERILATOR_ROOT     = /usr/local/share/verilator

Environment:
    PERL               = 
    SYSTEMC            = 
    SYSTEMC_ARCH       = 
    SYSTEMC_INCLUDE    = 
    SYSTEMC_LIBDIR     = 
    VERILATOR_ROOT     = 
    VERILATOR_BIN      = 
[Inferior 1 (process 28116) exited normally]
No stack.
verilator --debug --debugi 0 --gdbbt --no-dump-tree --cc +librescan +libext+.sv --top-module makerchip -y . -y /src/verilog -y /src/sandhost -y /src/proj_default -y /src/lib +incdir+. +incdir+./sv_url_inc +incdir+/src/verilog +incdir+/src/sandhost +incdir+/src/proj_default +incdir+/src/lib makerchip.sv --assert --trace
No stack.
Starting Verilator 4.027 devel rev v4.026-36-g22088c9
Starting Verilator 4.027 devel rev v4.026-36-g22088c9
%Error: top.tlv:46: syntax error, unexpected ')'
                            )
                            ^
        /src/makerchip.sv:29: ... note: In file included from makerchip.sv
%Error: Exiting due to 1 error(s)
[Inferior 1 (process 28131) exited with code 01]
No stack.
%Error: export VERILATOR_ROOT=
%Error: gdb /usr/local/bin/verilator_bin_dbg --batch --quiet --return-child-result -ex "run --debug --debugi 0 --gdbbt --no-dump-tree --cc \+librescan \+libext\+.sv --top-module makerchip -y . -y /src/verilog -y /src/sandhost -y /src/proj_default -y /src/lib \+incdir\+. \+incdir\+./sv_url_inc \+incdir\+/src/verilog \+incdir\+/src/sandhost \+incdir\+/src/proj_default \+incdir\+/src/lib makerchip.sv --assert --trace" -ex 'set width 0' -ex 'bt' -ex 'quit'
%Error: Command Failed gdb /usr/local/bin/verilator_bin_dbg --batch --quiet --return-child-result -ex "run --debug --debugi 0 --gdbbt --no-dump-tree --cc \+librescan \+libext\+.sv --top-module makerchip -y . -y /src/verilog -y /src/sandhost -y /src/proj_default -y /src/lib \+incdir\+. \+incdir\+./sv_url_inc \+incdir\+/src/verilog \+incdir\+/src/sandhost \+incdir\+/src/proj_default \+incdir\+/src/lib makerchip.sv --assert --trace" -ex 'set width 0' -ex 'bt' -ex 'quit'
/src/Makefile:50: recipe for target 'prep' failed
make: *** [prep] Error 1
xkf5jG
/top
|calc
@2
@1
@3
@0
$ctrl=
$diff=
$g0_valid_or_reset=
$mem=
$out=
$prod=
$quot=
$rand2=
$reset=
$sum=
$val1=
$val2=
$valid=
$valid_
or_
reset=
*cyc_cnt
*failed
*passed
*reset
----------------------------------------------------------------------
///////////////////error/////////////////////////////////
------------------------------------------------------------------------
stuck with a syntax error 
Starting Verilator 4.027 devel rev v4.026-36-g22088c9
%Error: top.tlv:46: syntax error, unexpected ')'
                            )
                            ^
        /src/makerchip.sv:29: ... note: In file included from makerchip.sv
%Error: Exiting due to 1 error(s)
[Inferior 1 (process 28131) exited with code 01]
No stack.
-------------------------------------------------------------------


