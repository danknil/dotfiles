pragma Singleton

import Quickshell

Singleton {
    /*
        Display selection

        Use one of:
        - "*"                 all displays
        - "DP-1"              exact monitor name
        - "HDMI-A-1"
        - "eDP-1"

        You can get names with:
        hyprctl monitors
    */

    readonly property string barDisplay: "*"
    readonly property string notificationDisplay: "*"
    readonly property string osdDisplay: "*"

    /*
        Layout
    */

    readonly property int barHeight: 34
    readonly property int gap: 8
    readonly property int radius: 12

    readonly property int screenMargin: 8
    readonly property int notificationWidth: 340
    readonly property int notificationHeight: 600

    readonly property int osdWidth: 240
    readonly property int osdHeight: 86

    /*
        Theme
    */

    readonly property color bg: "#11111b"
    readonly property color bgAlt: "#181825"
    readonly property color fg: "#cdd6f4"
    readonly property color muted: "#6c7086"
    readonly property color accent: "#89b4fa"
    readonly property color urgent: "#f38ba8"

    readonly property string font: "JetBrainsMono Nerd Font"

    /*
        Helpers
    */

    function matchesDisplay(screen, target) {
        if (target === "*")
            return true

        if (!screen)
            return false

        return screen.name === target
    }
}
