import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts

Scope {
  id: root

//  NotificationServer {
//    id: notificationServer
//    onNotification: notification => notification.tracked = true
//  }

  Variants {
    model: Quickshell.screens

    PanelWindow {
      id: panelBar
      
      required property var modelData
      screen: modelData

      color: "#1e1e2e"
      implicitHeight: 30

      anchors {
        top: true
        left: true
        right: true
      }

      Text {
        anchors.verticalCenterOffset: -1
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
        text: Clock.time
        color: "#cba6f7"
        font.family: "Hack Nerd Font Mono"
        font.pointSize: 12
      }

      Text {
        anchors.verticalCenterOffset: -1
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
        text: Battery.battery
        color: "#cba6f7"
        font.family: "Hack Nerd Font Mono"
        font.pointSize: 12
      }

      Rectangle {
        anchors.bottom: parent.bottom
        width: parent.width
        height: 2
        color: "#cba6f7"
      }

      // PopupWindow {
      //   id: notifications

      //   color: "#1e1e2e"
      //   anchor.window: panelBar
      //   anchor.rect.x: panelBar.width / 2
      //   anchor.rect.y: panelBar.height + 10
      //   implicitWidth: 500
      //   implicitHeight: 500
      //   visible: false

      //   Text {
      //     text: notificationServer.trackedNotifications.values.length
      //     color: "#cba6f7"
      //     font.pointSize: 24
      //   }
      // }
    }
  }
}
