pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    readonly property string clock: Qt.formatDateTime(clockSource.date, "HH:mm")
    readonly property string date: Qt.formatDateTime(clockSource.date, "ddd d MMM")

    SystemClock {
        id: clockSource
        precision: SystemClock.Minutes
    }
}
