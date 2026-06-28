import Quickshell

import "modules/bar"
import "modules/osd"
import "modules/notifications"

ShellRoot {
    Bar {}
    Osd {}
    NotificationDaemon {}
}
