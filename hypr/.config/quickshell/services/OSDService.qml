pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    property bool visible: false
    property string icon: ""
    property string label: "Volume"
    property real value: 0.5

    function show(newIcon, newLabel, newValue) {
        icon = newIcon
        label = newLabel
        value = Math.max(0, Math.min(1, newValue))
        visible = true
        hideTimer.restart()
    }

    Timer {
        id: hideTimer
        interval: 1200
        repeat: false
        onTriggered: root.visible = false
    }
}
