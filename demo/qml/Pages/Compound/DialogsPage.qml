/*
 * This file is part of Fluid.
 *
 * Copyright (C) 2017 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 *
 * $BEGIN_LICENSE:MPL2$
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * $END_LICENSE$
 */

import QtQuick 2.0
import QtQuick.Controls 2.1
import Fluid.Controls 1.0 as FluidControls
import QtQuick.Controls.Material 2.0

Item {
    Column {
        anchors.centerIn: parent

        Button {
            text: qsTr("Alert")
            onClicked: alert.open()
        }

        Button {
            text: qsTr("Input")
            onClicked: input.open()
        }

        Button {
            text: qsTr("DatePicker")
            onClicked: datePickerPopup.show()
        }

        Button {
            text: qsTr("TimePicker")
            onClicked: timePickerPopup.show()
        }
    }

    FluidControls.AlertDialog {
        id: alert

        x: (parent.width - width) / 2
        y: (parent.height - height) / 2

        text: qsTr("Discard draft?")
        standardButtons: Dialog.Discard | Dialog.Cancel
    }

    FluidControls.InputDialog {
        id: input

        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        width: 280

        title: qsTr("In what year were you born?")
        text: qsTr("We need to know in what year you were born in order to verify your age.")
        textField.inputMask: "9999"
        textField.placeholderText: qsTr("Type a 4 digits number")
    }

    Popup {

        function show() {
            datepicker.show("MONTH")
            datePickerPopup.open()
        }

        id: datePickerPopup
        modal: true
        dim: false
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        padding: 0
        Component.onCompleted: {
            var p = parent;
            while(p.parent != undefined)
                p = p.parent;
            parent = p;
        }

        FluidControls.DatePicker {
            id: datepicker
            onAccepted: datePickerPopup.close()
            onRejected: datePickerPopup.close()

            standardButtons: DialogButtonBox.Ok | DialogButtonBox.Cancel
            standardButtonsContainer: Button {
                height: parent.height - 5
                anchors.verticalCenter: parent.verticalCenter
                text: "Now"
                flat: true
                onClicked: datepicker.selectedDate = new Date()
            }
        }
    }

    Popup {

        function show() {
            timepicker.show("HOUR")
            timePickerPopup.open()
        }

        id: timePickerPopup
        modal: true
        dim: false
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        padding: 0
        Component.onCompleted: {
            var p = parent;
            while(p.parent != undefined)
                p = p.parent;
            parent = p;
        }

        FluidControls.TimePicker {
            id: timepicker
            onAccepted: timePickerPopup.close()
            onRejected: timePickerPopup.close()
            standardButtons: DialogButtonBox.Ok | DialogButtonBox.Cancel
        }
    }
}
