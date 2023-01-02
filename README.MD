一	工程项目：
1	项目名称：fpga_training
2	项目使用的资源与软件：
(1)	正点原子开拓者FPGA开发板
(2)	示波器（推荐）
(3)	Quartus II 13.1
(4)	ModelSim 10.4

二	工程目标：
1	实验现象：
(1)	使用按键控制led灯的通断。
(2)	使用按键控制ram和fifo的读写并验证读写是否正确。
2	实验内容：
(1)	前仿环境下分别使用Altera IP核和纯rtl代码实现两路频率不同的时钟并进行ram读写测试、fifo读写测试，其中需要验证pll失锁时的情况和运行中强制修改ram的初始化内容的情况。
(2)	在fpga平台只需使用ram和fifo的Altera IP核进行实验，对工程进行综合编译，下载并固化fpga程序，观察实验现象。
(3)	使用Quartus II和ModelSim进行联合后仿验证。
(4)	对比fpga综合编译时选择不同编译策略或seed的结果，包括资源使用量、时序结果（例如Fmax）等。
3	具体要求：
(1)	按键控制led时，要求使用三段式状态机。
(2)	整个工程分为5个大模块，分别为时钟、按键、led、ram读写、fifo读写，每个模块要求使用增量编译，且ram读写和fifo读写两个模块要求使用lock region并在chip planner指定一块足够大的区域。
(3)	对所有出现的时钟进行约束，找出相互独立的时钟设置group，对复位信号设置false path。
(4)	使用stp查看ram读写和fifo读写的内部信号是否正确。
(5)	使用SingalProbe将时钟信号和按键信号连接至fpga管脚上进行测量。
(6)	在chip planner里面进行eco操作，改变pll器件输出的占空比并将其中的某些信号（例如时钟信号）连接至fpga管脚上进行测量。

三	学习目标（下述内容非先后顺序）：
1	学习verilog编程规则：
(1)	verilog基本语法规则以及相关高级的用法，包括genvar、generate、for、function、define、parameter、localparam等关键词用法。
(2)	三段式状态机的结构与用法。
(3)	模块化编程的思想。
2	学习常见ip核与基本逻辑功能模块的rtl实现：
(1)	Altera的pll IP核的使用以及失锁处理，以及时钟分频的简单rtl实现。
(2)	Altera的fifo IP核的使用，以及fifo的简单rtl实现。
(3)	Altera的ram IP核的使用以及初始化文件的使用，以及ram的简单rtl实现。
(4)	边沿检测的rtl实现。
(5)	信号同步的rtl实现。
(6)	二进制码和格雷码转换的rtl实现。
3	学习verilog仿真方法：
(1)	verilog仿真语法规则以及相关高级的用法，包括force、release、wait、readmemh、finish等关键词用法。
(2)	Testbench的编写。
(3)	激励的编写，包括仿真时钟信号的产生、复位信号的产生、mif文件的产生。
(4)	异常情形仿真的处理思路，例如pll失锁状态仿真（使用force）、中途修改存储器内部初始化内容（使用readmemh）等。
4	学习ModelSim软件使用方法：
(1)	单独使用ModelSim对工程进行编译、前仿。
(2)	分别对Altera IP核和rtl逻辑实现进行仿真。
(3)	查看指定信号的波形。
(4)	根据波形追踪信号。
5	学习Quartus II软件使用方法：
(1)	工程的建立与配置，引脚分配。
(2)	工程的编译流程，包括分析综合、布局布线、生成sof文件、时序分析等。
(3)	使用不同策略、seed进行编译综合，对比不同编译策略下的情况。
(4)	与ModelSim软件进行联合后仿。
(5)	生成的sof文件转化成jic文件进行fpga程序固化。
(6)	增量编译用法。
(7)	lock region用法。
(8)	使用technology map查看网表追踪信号。
(9)	使用chip planner查看器件内部使用情况，了解fpga内部器件结构与排布，并进行eco操作将时钟信号手动拉线至管脚。
(10)	使用STP查看内部信号，设置相关触发。
(11)	使用SingalProbe引出内部信号进行eco操作。
(12)	生成和使用TCL脚本。
6	学习静态时序分析方法：
(1)	使用TimeQuest软件进行时序分析，并阅读时序报告和查看最差路径。
(2)	编写sdc时序约束文件，使用clock、generate_clock、flase_path、group等对时序进行约束。

四	可以重复利用的资源：
1	工程项目目录下Library下面的内容，包括Altera仿真库、基本功能逻辑RTL的实现。
2	工程项目目录下User\Verilog\clock_tree.v，这里处理了PLL失锁时的必要操作保证整体系统能够正常稳定地运行。
3	其他内容无实际项目参考意义，仅供学习而设计。

五	注意事项：
1	ModelSim软件存在define的bug，每一次运行前仿的时候请检查define是否正确。方法是在控制台输入vlog，弹出的对话框内粘贴对应的define信息，具体在仿真文件夹里面的Script文件夹里面找对应的.f文件。
2	小编时间仓促，因此项目中有不完善的地方敬请大家提出建议。
3	学习交流群1126635164。

六	项目环境目录介绍：
项目目录下，各文件夹的含义是（含空文件夹）：
Doc目录为项目文档，包括参考资料、设计文档、原理图等。
Library目录为项目所使用到的库文件，包括仿真库、Monitor、Model、ThirdParty Firmware等。
Project目录为项目包含的工程的目录，包括fpga工程、firmware工程、pcb工程等，以及工程专用代码、脚本等。
Script目录包含项目专用的脚本、功能等。
Sim目录为项目包含的仿真的目录，包含仿真工程、testbench、激励文件、脚本等、以及仿真专用代码、脚本等。
User目录包含用户主要的项目文件，包含rtl代码、firmware代码等。
目前最适合的使用方法是使用Cygwin，编辑代码、文件操作在Cygwin下面，软件使用在Windows下面，可以大幅节省开发时间。后期会开发快捷键切换目录，届时适合在Cygwin、Linux环境下运行。

