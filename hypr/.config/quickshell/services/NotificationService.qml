pragma Singleton

import Quickshell
import Quickshell.Services.Notifications

Singleton {
    id: root

    NotificationServer {
        id: server

        bodySupported: true
        bodyMarkupSupported: false
        imageSupported: false
        actionsSupported: false
        keepOnReload: false

        onNotification: notification => {
            notification.tracked = true
        }
    }

    readonly property var notifications: server.trackedNotifications
}
