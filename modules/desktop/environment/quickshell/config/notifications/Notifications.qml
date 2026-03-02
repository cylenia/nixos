import Quickshell
import Quickshell.Services.Notifications
import QtQuick
import QtQuick.Layouts

PopupWindow {
  id: notifications

  required property NotificationServer notificationServer
  required property PanelWindow panelWindow
  required property bool isVisible

  color: "transparent"
  anchor.window: panelWindow
  anchor.rect.x: panelWindow.width / 2 - 250
  anchor.rect.y: panelWindow.height + 8
  implicitWidth: 500
  implicitHeight: notificationColumn.height
  visible: isVisible && notificationServer.trackedNotifications.values.length > 0

  ColumnLayout {
    id: notificationColumn
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
