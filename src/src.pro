TEMPLATE = app

QT += qml quick quickcontrols2 xml

CONFIG += c++11

SOURCES += main.cpp \
    resourcegenerator.cpp

DISTFILES += ../.gitignore

DEFINES += BUILD_PATH=\\\"$$OUT_PWD/\\\"
DEFINES += SRC_PATH=\\\"$$PWD/\\\"

include(vendor/vendor.pri)

HEADERS += \
    resourcegenerator.h
