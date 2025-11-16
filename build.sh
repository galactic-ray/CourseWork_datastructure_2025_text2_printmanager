#!/bin/bash

# 打印机管理器GUI构建脚本

echo "=== 打印机管理器GUI构建脚本 ==="

# 确保在项目根目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

# 确保data目录存在
mkdir -p data

# 检查Qt是否安装
if command -v qmake &> /dev/null; then
    echo "使用qmake构建..."
    qmake PrintManager.pro
    if [ $? -eq 0 ]; then
        make
        if [ $? -eq 0 ]; then
            echo "构建成功！"
            echo "运行方式: ./PrintManagerGUI"
            echo "注意: 请在项目根目录运行程序，以确保能访问 data/ 目录"
        else
            echo "构建失败！"
            exit 1
        fi
    else
        echo "qmake配置失败！"
        exit 1
    fi
elif command -v cmake &> /dev/null; then
    echo "使用CMake构建..."
    mkdir -p build
    cd build
    cmake ..
    if [ $? -eq 0 ]; then
        make
        if [ $? -eq 0 ]; then
            cd ..
            echo "构建成功！"
            echo "运行方式: ./build/PrintManagerGUI"
            echo "注意: 请在项目根目录运行程序，以确保能访问 data/ 目录"
        else
            echo "构建失败！"
            exit 1
        fi
    else
        echo "CMake配置失败！"
        exit 1
    fi
else
    echo "错误：未找到qmake或cmake！"
    echo "请安装Qt开发工具："
    echo "  Ubuntu/Debian: sudo apt-get install qt5-default qtbase5-dev"
    echo "  或: sudo apt-get install qt6-base-dev"
    exit 1
fi

