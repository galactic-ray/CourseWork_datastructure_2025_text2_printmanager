QT += core widgets
QT -= gui

CONFIG += c++17

TARGET = PrintManagerGUI
TEMPLATE = app

SOURCES += \
    src/main_gui.cpp \
    src/mainwindow.cpp

HEADERS += \
    src/mainwindow.h \
    src/printmanager.h

