TEMPLATE = app

QT += qml quick quickcontrols2

CONFIG += c++11

SOURCES += main.cpp

DISTFILES += ../.gitignore

DEFINES += BUILD_PATH=\\\"$$OUT_PWD/\\\"
DEFINES += SRC_PATH=\\\"$$PWD/\\\"

include(vendor/vendor.pri)
