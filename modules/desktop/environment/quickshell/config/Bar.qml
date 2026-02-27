import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes

Scope {
  id: root

 NotificationServer {
   id: notificationServer
   onNotification: notification => notification.tracked = true
 }

  Variants {
    model: Quickshell.screens

    PanelWindow {
      id: panelBar
      
      required property var modelData
      screen: modelData

      color: "transparent"
      implicitHeight: 30

      anchors {
        top: true
        left: true
        right: true
      }

      Rectangle {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        width: parent.width
        height: 30
        color: "#1e1e2e"
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

      PopupWindow {
        id: notifications

        color: "transparent"
        anchor.window: panelBar
        anchor.rect.x: panelBar.width / 2 - 250
        anchor.rect.y: panelBar.height + 10
        implicitWidth: 500
        implicitHeight: asdasd.height
        visible: notificationServer.trackedNotifications.values.length > 0

        ColumnLayout {
          id: asdasd
          spacing: 10

          Repeater {
            model: notificationServer.trackedNotifications.values

            Rectangle {
              required property Notification modelData
              
              color: "#1e1e2e"
              width: 500
              height: 100
              border.color: "#cba6f7"
              border.width: 2

              MouseArea {
                anchors.fill: parent
                onClicked: parent.modelData.dismiss()
              }

              Text {
                width: 490
                height: 90
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                color: "#cba6f7"
                font.family: "Hack Nerd Font Mono"
                font.pointSize: 12
                text: `${parent.modelData.appName} - ${parent.modelData.summary}\n\n${parent.modelData.body}`
              }
            }
          }          
        }
      }
    }
  }
}
