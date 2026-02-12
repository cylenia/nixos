import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Scope {
  id: root

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
        anchors.leftMargin: 1
        text: Clock.time
        color: "#cba6f7"
        font.family: "Hack Nerd Font Mono"
        font.pointSize: 12
      }

      Text {
        anchors.verticalCenterOffset: -1
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 1
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
    }
  }
}
