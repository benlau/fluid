TEMPLATE = app

QT += qml quick quickcontrols2 xml

CONFIG += c++11

include(../dist/fluid.pri)

HEADERS += \
    iconnamemodel.h \
    iconcategorymodel.h

SOURCES += \
    iconnamemodel.cpp \
    iconcategorymodel.cpp \
    main.cpp

DISTFILES += \
    qml/icons.txt \
    qml/main.qml \
    qml/StyledRectangle.qml \
    qml/StyledPage.qml \
    qml/Style.qml \
    qml/LayoutComponents.qml \
    qml/Controls.qml \
    qml/BasicComponents.qml \
    qml/Pages/Style/TypographyPage.qml \
    qml/Pages/Style/SystemIconsPage.qml \
    qml/Pages/Style/PaletteSwatch.qml \
    qml/Pages/Style/PalettePage.qml \
    qml/Pages/Style/IconsPage.qml

RESOURCES += \
    qml.qrc
