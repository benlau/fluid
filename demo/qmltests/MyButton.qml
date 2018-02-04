import QtQuick 2.0

Rectangle {
    width: 100
    height: 100
    color: "#1fff0000"

    property int value: 10

    Text {
        anchors.centerIn: parent
        text: value
    }

    MouseArea {
        anchors.fill: parent
        onClicked: value--
    }

}
