
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
create_project: 2

00:00:092

00:00:092

1416.9302
0.0272
15122
8199Z17-722h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental /home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/utils_1/imports/synth_1/cpuTopLevel.dcpZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2\
Z/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/utils_1/imports/synth_1/cpuTopLevel.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
d
Command: %s
53*	vivadotcl23
1synth_design -top topLevel -part xc7a100tcsg324-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
{
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2

xc7a100tZ17-347h px� 
k
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2

xc7a100tZ17-349h px� 
E
Loading part %s157*device2
xc7a100tcsg324-1Z21-403h px� 
[
$Part: %s does not have CEAM library.966*device2
xc7a100tcsg324-1Z21-9227h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
4Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
O
#Helper process launched with PID %s4824*oasys2
199710Z8-7075h px� 
�
%s*synth2�
�Starting RTL Elaboration : Time (s): cpu = 00:00:05 ; elapsed = 00:00:05 . Memory (MB): peak = 2144.684 ; gain = 412.746 ; free physical = 492 ; free virtual = 7180
h px� 
�
synthesizing module '%s'638*oasys2

topLevel2Q
M/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/topLevel.vhd2
428@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
cpuTopLevel2R
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/cpuTopLevel.vhd2
302	
cpuCalc2
cpuTopLevel2Q
M/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/topLevel.vhd2
498@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
cpuTopLevel2T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/cpuTopLevel.vhd2
368@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
programCounter2U
S/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/programCounter.vhd2
252
programCounterCalc2
programCounter2T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/cpuTopLevel.vhd2
1948@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
programCounter2W
S/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/programCounter.vhd2
328@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
programCounter2
02
12W
S/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/programCounter.vhd2
328@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
instructionMemory2X
V/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/instructionMemory.vhd2
262
instructionMemoryCalc2
instructionMemory2T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/cpuTopLevel.vhd2
1968@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
instructionMemory2Z
V/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/instructionMemory.vhd2
328@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
instructionMemory2
02
12Z
V/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/instructionMemory.vhd2
328@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Control_Unit2S
Q/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/Control_Unit.vhd2
272
controlUnitCalc2
controlUnit2T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/cpuTopLevel.vhd2
1988@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
Control_Unit2U
Q/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/Control_Unit.vhd2
428@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
Control_Unit2
02
12U
Q/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/Control_Unit.vhd2
428@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Mux2J
H/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/Mux.vhd2
252
regDstMuxCalc2
ThreeBitMux2T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/cpuTopLevel.vhd2
2008@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
Mux2L
H/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/Mux.vhd2
348@Z8-638h px� 
D
%s
*synth2,
*	Parameter N bound to: 3 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
Mux2
02
12L
H/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/Mux.vhd2
348@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	registers2P
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/registers.vhd2
252
registerFileCalc2
	registers2T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/cpuTopLevel.vhd2
2028@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	registers2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/registers.vhd2
338@Z8-638h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
registerVals2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/registers.vhd2
508@Z8-614h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
	registers2
02
12R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/registers.vhd2
338@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Sign_Extend2R
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/Sign_Extend.vhd2
252
signExtendCalc2
signExtender2T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/cpuTopLevel.vhd2
2048@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
Sign_Extend2T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/Sign_Extend.vhd2
318@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
Sign_Extend2
02
12T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/Sign_Extend.vhd2
318@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Mux2J
H/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/Mux.vhd2
252
ALUSrcMuxCalc2
SixteenBitMux2T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/cpuTopLevel.vhd2
2068@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
Mux__parameterized02L
H/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/Mux.vhd2
348@Z8-638h px� 
E
%s
*synth2-
+	Parameter N bound to: 16 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
Mux__parameterized02
02
12L
H/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/Mux.vhd2
348@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
ALU2P
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/aluDesign.vhd2
232	
ALUCalc2
alu2T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/cpuTopLevel.vhd2
2088@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
ALU2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/aluDesign.vhd2
578@Z8-638h px� 
E
%s
*synth2-
+	Parameter N bound to: 16 - type: integer 
h p
x
� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	nBitAdder2P
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/nBitAdder.vhd2
262
adder2
	nBitAdder2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/aluDesign.vhd2
828@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
	nBitAdder2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/nBitAdder.vhd2
368@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
oneBitAdder2P
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/1bitAdder.vhd2
262
zeroBitAdder2
oneBitAdder2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/nBitAdder.vhd2
468@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
oneBitAdder2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/1bitAdder.vhd2
348@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
oneBitAdder2
02
12R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/1bitAdder.vhd2
348@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
oneBitAdder2P
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/1bitAdder.vhd2
262
iAdder2
oneBitAdder2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/nBitAdder.vhd2
518@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
oneBitAdder2P
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/1bitAdder.vhd2
262
iAdder2
oneBitAdder2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/nBitAdder.vhd2
518@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
oneBitAdder2P
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/1bitAdder.vhd2
262
iAdder2
oneBitAdder2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/nBitAdder.vhd2
518@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
oneBitAdder2P
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/1bitAdder.vhd2
262
iAdder2
oneBitAdder2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/nBitAdder.vhd2
518@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
oneBitAdder2P
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/1bitAdder.vhd2
262
iAdder2
oneBitAdder2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/nBitAdder.vhd2
518@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
oneBitAdder2P
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/1bitAdder.vhd2
262
iAdder2
oneBitAdder2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/nBitAdder.vhd2
518@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
oneBitAdder2P
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/1bitAdder.vhd2
262
iAdder2
oneBitAdder2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/nBitAdder.vhd2
518@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
oneBitAdder2P
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/1bitAdder.vhd2
262
iAdder2
oneBitAdder2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/nBitAdder.vhd2
518@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
oneBitAdder2P
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/1bitAdder.vhd2
262
iAdder2
oneBitAdder2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/nBitAdder.vhd2
518@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
oneBitAdder2P
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/1bitAdder.vhd2
262
iAdder2
oneBitAdder2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/nBitAdder.vhd2
518@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
oneBitAdder2P
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/1bitAdder.vhd2
262
iAdder2
oneBitAdder2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/nBitAdder.vhd2
518@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
oneBitAdder2P
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/1bitAdder.vhd2
262
iAdder2
oneBitAdder2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/nBitAdder.vhd2
518@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
oneBitAdder2P
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/1bitAdder.vhd2
262
iAdder2
oneBitAdder2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/nBitAdder.vhd2
518@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
oneBitAdder2P
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/1bitAdder.vhd2
262
iAdder2
oneBitAdder2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/nBitAdder.vhd2
518@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
oneBitAdder2P
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/1bitAdder.vhd2
262
iAdder2
oneBitAdder2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/nBitAdder.vhd2
518@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
	nBitAdder2
02
12R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/nBitAdder.vhd2
368@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	nBitAdder2P
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/nBitAdder.vhd2
262

subtractor2
	nBitAdder2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/aluDesign.vhd2
858@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
	nBitAdder2P
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/nBitAdder.vhd2
262
twoCompliment2
	nBitAdder2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/aluDesign.vhd2
898@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

comparator2Q
O/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/comparator.vhd2
262	
compare2

comparator2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/aluDesign.vhd2
928@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2

comparator2S
O/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/comparator.vhd2
318@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2

comparator2
02
12S
O/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/comparator.vhd2
318@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
ALU2
02
12R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/aluDesign.vhd2
578@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

aluControl2Q
O/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/aluControl.vhd2
252
ALUControlUnitCalc2
aluControlUnit2T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/cpuTopLevel.vhd2
2138@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2

aluControl2S
O/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/aluControl.vhd2
338@Z8-638h px� 
�
default block is never used226*oasys2S
O/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/aluControl.vhd2
398@Z8-226h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2

aluControl2
02
12S
O/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/aluControl.vhd2
338@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Data_Memory2R
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/Data_Memory.vhd2
342
dataMemoryCalc2

dataMemory2T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/cpuTopLevel.vhd2
2158@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
Data_Memory2T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/Data_Memory.vhd2
448@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
Data_Memory2
02
12T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/Data_Memory.vhd2
448@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Mux2J
H/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/Mux.vhd2
252
memToRegMuxCalc2
SixteenBitMux2T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/cpuTopLevel.vhd2
2178@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
adder22M
K/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/adder2.vhd2
352
twoAdderCalc2

twoAdder2T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/cpuTopLevel.vhd2
2218@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
adder22O
K/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/adder2.vhd2
418@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
adder22
02
12O
K/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/adder2.vhd2
418@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
jumpLeftShifter2Q
O/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/shiftLeft2.vhd2
252
jumpAddressCalc2
jumpLeftShifter2T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/cpuTopLevel.vhd2
2238@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
jumpLeftShifter2S
O/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/shiftLeft2.vhd2
308@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
jumpLeftShifter2
02
12S
O/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/shiftLeft2.vhd2
308@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
branchLeftShifter2X
V/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/branchLeftShifter.vhd2
252
branchAddressShifterCalc2
branchLeftShifter2T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/cpuTopLevel.vhd2
2298@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
branchLeftShifter2Z
V/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/branchLeftShifter.vhd2
308@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
branchLeftShifter2
02
12Z
V/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/branchLeftShifter.vhd2
308@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
adder2L
J/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/adder.vhd2
262
branchAddressAdderCalc2
adder2T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/cpuTopLevel.vhd2
2318@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
adder2N
J/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/adder.vhd2
338@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
adder2
02
12N
J/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/adder.vhd2
338@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Mux2J
H/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/Mux.vhd2
252
branchMuxCalc2
SixteenBitMux2T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/cpuTopLevel.vhd2
2338@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
Mux2J
H/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/Mux.vhd2
252
jumpMuxCalc2
SixteenBitMux2T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/cpuTopLevel.vhd2
2358@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
cpuTopLevel2
02
12T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/cpuTopLevel.vhd2
368@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2

topLevel2
02
12Q
M/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/topLevel.vhd2
428@Z8-256h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
clock_cycle_reg2T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/Data_Memory.vhd2
678@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
ccCounter_reg2T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/cpuTopLevel.vhd2
2428@Z8-6014h px� 
i
+design %s has port %s driven by constant %s3447*oasys2

topLevel2	
LED[15]2
1Z8-3917h px� 
i
+design %s has port %s driven by constant %s3447*oasys2

topLevel2	
LED[14]2
1Z8-3917h px� 
i
+design %s has port %s driven by constant %s3447*oasys2

topLevel2	
LED[13]2
1Z8-3917h px� 
i
+design %s has port %s driven by constant %s3447*oasys2

topLevel2	
LED[12]2
1Z8-3917h px� 
i
+design %s has port %s driven by constant %s3447*oasys2

topLevel2	
LED[11]2
1Z8-3917h px� 
i
+design %s has port %s driven by constant %s3447*oasys2

topLevel2	
LED[10]2
1Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

topLevel2
LED[9]2
1Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

topLevel2
LED[8]2
1Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

topLevel2
LED[7]2
1Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

topLevel2
LED[6]2
1Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

topLevel2
LED[5]2
1Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

topLevel2
LED[4]2
1Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

topLevel2
LED[3]2
1Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

topLevel2
LED[2]2
1Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

topLevel2
LED[1]2
1Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

topLevel2
LED[0]2
1Z8-3917h px� 
w
9Port %s in module %s is either unconnected or has no load4866*oasys2
clk2
instructionMemoryZ8-7129h px� 
s
9Port %s in module %s is either unconnected or has no load4866*oasys2
reset2
cpuTopLevelZ8-7129h px� 
q
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[15]2

topLevelZ8-7129h px� 
q
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[14]2

topLevelZ8-7129h px� 
q
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[13]2

topLevelZ8-7129h px� 
q
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[12]2

topLevelZ8-7129h px� 
q
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[11]2

topLevelZ8-7129h px� 
q
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[10]2

topLevelZ8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[9]2

topLevelZ8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[8]2

topLevelZ8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[7]2

topLevelZ8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[6]2

topLevelZ8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[5]2

topLevelZ8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[4]2

topLevelZ8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[3]2

topLevelZ8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[2]2

topLevelZ8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[1]2

topLevelZ8-7129h px� 
�
%s*synth2�
�Finished RTL Elaboration : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 2296.293 ; gain = 564.355 ; free physical = 326 ; free virtual = 7016
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 2308.168 ; gain = 576.230 ; free physical = 326 ; free virtual = 7016
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 2308.168 ; gain = 576.230 ; free physical = 326 ; free virtual = 7016
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Netlist sorting complete. 2

00:00:002
00:00:00.012

2308.1682
0.0002
3262
7016Z17-722h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2j
f/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/constrs_1/imports/givenSources/Nexys4DDR_Master.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2j
f/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/constrs_1/imports/givenSources/Nexys4DDR_Master.xdc8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2h
f/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/constrs_1/imports/givenSources/Nexys4DDR_Master.xdc2
.Xil/topLevel_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Netlist sorting complete. 2

00:00:002

00:00:002

2450.9182
0.0002
3172
7007Z17-722h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
 Constraint Validation Runtime : 2
00:00:00.012

00:00:002

2450.9182
0.0002
3172
7007Z17-722h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Constraint Validation : Time (s): cpu = 00:00:16 ; elapsed = 00:00:17 . Memory (MB): peak = 2450.918 ; gain = 718.980 ; free physical = 307 ; free virtual = 6995
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Loading part: xc7a100tcsg324-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:16 ; elapsed = 00:00:17 . Memory (MB): peak = 2450.918 ; gain = 718.980 ; free physical = 307 ; free virtual = 6995
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:16 ; elapsed = 00:00:17 . Memory (MB): peak = 2450.918 ; gain = 718.980 ; free physical = 307 ; free virtual = 6995
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
!inferring latch for variable '%s'327*oasys2
C_reg2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/aluDesign.vhd2
1018@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2

Zero_reg2R
N/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/aluDesign.vhd2
1038@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2

output_reg2S
O/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/aluControl.vhd2
418@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
ReadData_reg2T
P/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.srcs/sources_1/new/Data_Memory.vhd2
738@Z8-327h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:18 ; elapsed = 00:00:19 . Memory (MB): peak = 2450.918 ; gain = 718.980 ; free physical = 313 ; free virtual = 7007
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   17 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   16 Bit       Adders := 1     
h p
x
� 
&
%s
*synth2
+---XORs : 
h p
x
� 
H
%s
*synth20
.	   2 Input     16 Bit         XORs := 2     
h p
x
� 
H
%s
*synth20
.	   2 Input      1 Bit         XORs := 96    
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               16 Bit    Registers := 9     
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   16 Bit        Muxes := 5     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   3 Input    2 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	  14 Input    1 Bit        Muxes := 8     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 12    
h p
x
� 
F
%s
*synth2.
,	  12 Input    1 Bit        Muxes := 1     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
q
%s
*synth2Y
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
i
+design %s has port %s driven by constant %s3447*oasys2

topLevel2	
LED[15]2
1Z8-3917h px� 
i
+design %s has port %s driven by constant %s3447*oasys2

topLevel2	
LED[14]2
1Z8-3917h px� 
i
+design %s has port %s driven by constant %s3447*oasys2

topLevel2	
LED[13]2
1Z8-3917h px� 
i
+design %s has port %s driven by constant %s3447*oasys2

topLevel2	
LED[12]2
1Z8-3917h px� 
i
+design %s has port %s driven by constant %s3447*oasys2

topLevel2	
LED[11]2
1Z8-3917h px� 
i
+design %s has port %s driven by constant %s3447*oasys2

topLevel2	
LED[10]2
1Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

topLevel2
LED[9]2
1Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

topLevel2
LED[8]2
1Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

topLevel2
LED[7]2
1Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

topLevel2
LED[6]2
1Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

topLevel2
LED[5]2
1Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

topLevel2
LED[4]2
1Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

topLevel2
LED[3]2
1Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

topLevel2
LED[2]2
1Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

topLevel2
LED[1]2
1Z8-3917h px� 
h
+design %s has port %s driven by constant %s3447*oasys2

topLevel2
LED[0]2
1Z8-3917h px� 
w
9Port %s in module %s is either unconnected or has no load4866*oasys2
clk2
instructionMemoryZ8-7129h px� 

9Port %s in module %s is either unconnected or has no load4866*oasys2
readAddr[0]2
instructionMemoryZ8-7129h px� 
q
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[15]2

topLevelZ8-7129h px� 
q
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[14]2

topLevelZ8-7129h px� 
q
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[13]2

topLevelZ8-7129h px� 
q
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[12]2

topLevelZ8-7129h px� 
q
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[11]2

topLevelZ8-7129h px� 
q
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[10]2

topLevelZ8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[9]2

topLevelZ8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[8]2

topLevelZ8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[7]2

topLevelZ8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[6]2

topLevelZ8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[5]2

topLevelZ8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[4]2

topLevelZ8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[3]2

topLevelZ8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[2]2

topLevelZ8-7129h px� 
p
9Port %s in module %s is either unconnected or has no load4866*oasys2
SW[1]2

topLevelZ8-7129h px� 
u
9Port %s in module %s is either unconnected or has no load4866*oasys2

CPU_RESETN2

topLevelZ8-7129h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
cpuCalc/ALUCalc/C_reg[15]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
cpuCalc/ALUCalc/C_reg[14]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
cpuCalc/ALUCalc/C_reg[13]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
cpuCalc/ALUCalc/C_reg[12]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
cpuCalc/ALUCalc/C_reg[11]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
cpuCalc/ALUCalc/C_reg[10]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
cpuCalc/ALUCalc/C_reg[9]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
cpuCalc/ALUCalc/C_reg[8]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
cpuCalc/ALUCalc/C_reg[7]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
cpuCalc/ALUCalc/C_reg[6]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
cpuCalc/ALUCalc/C_reg[5]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
cpuCalc/ALUCalc/C_reg[4]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
cpuCalc/ALUCalc/C_reg[3]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
cpuCalc/ALUCalc/C_reg[2]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
cpuCalc/ALUCalc/C_reg[1]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
cpuCalc/ALUCalc/C_reg[0]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2
cpuCalc/ALUCalc/Zero_reg2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2*
(cpuCalc/ALUControlUnitCalc/output_reg[3]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2*
(cpuCalc/ALUControlUnitCalc/output_reg[2]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2*
(cpuCalc/ALUControlUnitCalc/output_reg[1]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2*
(cpuCalc/ALUControlUnitCalc/output_reg[0]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpuCalc/dataMemoryCalc/ReadData_reg[15]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpuCalc/dataMemoryCalc/ReadData_reg[14]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpuCalc/dataMemoryCalc/ReadData_reg[13]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpuCalc/dataMemoryCalc/ReadData_reg[12]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpuCalc/dataMemoryCalc/ReadData_reg[11]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
'cpuCalc/dataMemoryCalc/ReadData_reg[10]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpuCalc/dataMemoryCalc/ReadData_reg[9]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpuCalc/dataMemoryCalc/ReadData_reg[8]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpuCalc/dataMemoryCalc/ReadData_reg[7]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpuCalc/dataMemoryCalc/ReadData_reg[6]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpuCalc/dataMemoryCalc/ReadData_reg[5]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpuCalc/dataMemoryCalc/ReadData_reg[4]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpuCalc/dataMemoryCalc/ReadData_reg[3]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpuCalc/dataMemoryCalc/ReadData_reg[2]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpuCalc/dataMemoryCalc/ReadData_reg[1]2

topLevelZ8-3332h px� 
�
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2(
&cpuCalc/dataMemoryCalc/ReadData_reg[0]2

topLevelZ8-3332h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:23 ; elapsed = 00:00:24 . Memory (MB): peak = 2450.918 ; gain = 718.980 ; free physical = 320 ; free virtual = 7029
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
h px� 
l
%s*synth2T
R---------------------------------------------------------------------------------
h px� 
;
%s*synth2#
!
ROM: Preliminary Mapping Report
h px� 
b
%s*synth2J
H+------------------+-----------------+---------------+----------------+
h px� 
c
%s*synth2K
I|Module Name       | RTL Object      | Depth x Width | Implemented As | 
h px� 
b
%s*synth2J
H+------------------+-----------------+---------------+----------------+
h px� 
c
%s*synth2K
I|instructionMemory | instructionVals | 65536x16      | LUT            | 
h px� 
c
%s*synth2K
I+------------------+-----------------+---------------+----------------+

h px� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
h px� 
l
%s*synth2T
R---------------------------------------------------------------------------------
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:30 ; elapsed = 00:00:31 . Memory (MB): peak = 2450.918 ; gain = 718.980 ; free physical = 331 ; free virtual = 7033
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Timing Optimization : Time (s): cpu = 00:00:30 ; elapsed = 00:00:31 . Memory (MB): peak = 2450.918 ; gain = 718.980 ; free physical = 331 ; free virtual = 7033
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Technology Mapping : Time (s): cpu = 00:00:30 ; elapsed = 00:00:31 . Memory (MB): peak = 2450.918 ; gain = 718.980 ; free physical = 331 ; free virtual = 7033
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished IO Insertion : Time (s): cpu = 00:00:35 ; elapsed = 00:00:36 . Memory (MB): peak = 2450.918 ; gain = 718.980 ; free physical = 331 ; free virtual = 7035
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:35 ; elapsed = 00:00:36 . Memory (MB): peak = 2450.918 ; gain = 718.980 ; free physical = 331 ; free virtual = 7035
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:35 ; elapsed = 00:00:36 . Memory (MB): peak = 2450.918 ; gain = 718.980 ; free physical = 331 ; free virtual = 7035
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:35 ; elapsed = 00:00:36 . Memory (MB): peak = 2450.918 ; gain = 718.980 ; free physical = 331 ; free virtual = 7035
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:35 ; elapsed = 00:00:36 . Memory (MB): peak = 2450.918 ; gain = 718.980 ; free physical = 331 ; free virtual = 7035
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:35 ; elapsed = 00:00:36 . Memory (MB): peak = 2450.918 ; gain = 718.980 ; free physical = 331 ; free virtual = 7035
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
| |BlackBox name |Instances |
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
0
%s*synth2
+------+-----+------+
h px� 
0
%s*synth2
|      |Cell |Count |
h px� 
0
%s*synth2
+------+-----+------+
h px� 
0
%s*synth2
|1     |OBUF |    16|
h px� 
0
%s*synth2
+------+-----+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:35 ; elapsed = 00:00:36 . Memory (MB): peak = 2450.918 ; gain = 718.980 ; free physical = 331 ; free virtual = 7035
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
a
%s
*synth2I
GSynthesis finished with 0 errors, 0 critical warnings and 76 warnings.
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Runtime : Time (s): cpu = 00:00:33 ; elapsed = 00:00:34 . Memory (MB): peak = 2450.918 ; gain = 576.230 ; free physical = 331 ; free virtual = 7035
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:36 ; elapsed = 00:00:36 . Memory (MB): peak = 2450.926 ; gain = 718.980 ; free physical = 331 ; free virtual = 7035
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Netlist sorting complete. 2

00:00:002

00:00:002

2450.9262
0.0002
3312
7035Z17-722h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Netlist sorting complete. 2

00:00:002

00:00:002

2450.9262
0.0002
6532
7360Z17-722h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

1a2279beZ4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
972
1122
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
synth_design: 2

00:00:462

00:00:422

2450.9262

1033.9962
6532
7360Z17-722h px� 
�
%s peak %s Memory [%s] %s12246*common2
synth_design2

Physical2
PSS2=
;(MB): overall = 1981.032; main = 1607.557; forked = 422.610Z17-2834h px� 
�
%s peak %s Memory [%s] %s12246*common2
synth_design2	
Virtual2
VSS2>
<(MB): overall = 3484.395; main = 2450.922; forked = 1033.473Z17-2834h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2
Write ShapeDB Complete: 2
00:00:00.012

00:00:002

2450.9262
0.0002
6592
7365Z17-722h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2I
G/home/bee/Projects/16BitCPU/16BitCPU/16BitCPU.runs/synth_1/topLevel.dcpZ17-1381h px� 
�
Executing command : %s
56330*	planAhead2[
Yreport_utilization -file topLevel_utilization_synth.rpt -pb topLevel_utilization_synth.pbZ12-24828h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Mon Nov 18 19:10:14 2024Z17-206h px� 


End Record