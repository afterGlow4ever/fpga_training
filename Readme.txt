当前为项目目录：

Doc目录为项目文档，包括参考资料、设计文档、原理图等。
Library目录为项目所使用到的库文件，包括仿真库、Monitor、Model、ThirdParty Firmware等。
Project目录为项目包含的工程的目录，包括fpga工程、firmware工程、pcb工程等，以及工程专用代码、脚本等。
Script目录包含项目专用的脚本、功能等。
Sim目录为项目包含的仿真的目录，包含仿真工程、testbench、激励文件、脚本等、以及仿真专用代码、脚本等。
User目录包含用户主要的项目文件，包含rtl代码、firmware代码等。


目前最适合的使用方法是使用Cygwin，编辑代码、文件操作在Cygwin下面，软件使用在Windows下面，可以大幅节省开发时间。后期会开发快捷键切换目录，届时适合在Cygwin、Linux环境下运行。