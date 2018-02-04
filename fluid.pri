INCLUDEPATH += $$PWD

QT += svg

RESOURCES +=     $$PWD/fluid.qrc

HEADERS += \
    $$PWD/windowdecoration.h \
    $$PWD/standardpaths.h \
    $$PWD/qqmlsortfilterproxymodel.h \
    $$PWD/qmldateutils.h \
    $$PWD/iconsimageprovider.h \
    $$PWD/device.h \
    $$PWD/clipboard.h \
    $$PWD/iconthemeimageprovider.h \
    $$PWD/coreplugin.h \
    $$PWD/controlsplugin.h

SOURCES += \
    $$PWD/windowdecoration.cpp \
    $$PWD/standardpaths.cpp \
    $$PWD/qqmlsortfilterproxymodel.cpp \
    $$PWD/qmldateutils.cpp \
    $$PWD/iconsimageprovider.cpp \
    $$PWD/device.cpp \
    $$PWD/clipboard.cpp \
    $$PWD/iconthemeimageprovider.cpp \
    $$PWD/coreplugin.cpp \
    $$PWD/controlsplugin.cpp
