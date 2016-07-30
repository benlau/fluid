/*
 * This file is part of Fluid.
 *
 * Copyright (C) 2016 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 *
 * $BEGIN_LICENSE:MPL2$
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * $END_LICENSE$
 */

import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import Fluid.Controls 1.0

Page {
    title: qsTr("Wave transition")

    Wave {
        id: wave
        initialX: parent.width - size
        initialY: parent.height - size
        size: 48
        color: Material.accentColor
    }

    Button {
        anchors.centerIn: parent
        text: qsTr("Toggle")
        onClicked: {
            if (wave.opened)
                wave.close(parent.width - wave.size, parent.height - wave.size)
            else
                wave.open(0, 0)
        }
    }
}