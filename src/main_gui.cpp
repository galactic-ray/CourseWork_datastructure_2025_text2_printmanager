#include "mainwindow.h"
#include <QApplication>
#include <QDir>
#include <QDebug>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    
    // 确保data目录存在
    QDir dir;
    if (!dir.exists("data")) {
        if (!dir.mkpath("data")) {
            qDebug() << "警告: 无法创建data目录";
        }
    }
    
    MainWindow window;
    window.show();
    
    return app.exec();
}

