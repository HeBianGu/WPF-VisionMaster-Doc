:: 添加子模块 git submodule add https://github.com/HeBianGu/WPF-Control.git Source/WPF-Control
:: 在克隆时自动初始化和更新子模块 git clone --recurse-submodules -b dev1.0.6 https://github.com/HeBianGu/WPF-Control.git Source/WPF-Control

:: 初始化子模块 git submodule init
::下载子模块代码 git submodule update
:: 指定递归下载（如果子模块嵌套子模块） git submodule update --init --recursive
:: 一步完成初始化和下载 git submodule update --init

@echo off
cd /d "%~dp0"
:: 拉取子模块
git -c http.proxy=http://192.168.1.8:5782 clone --recurse-submodules -b Release-2.0 https://github.com/HeBianGu/WPF-VisionMaster.git ../Source/WPF-VisionMaster
pause

