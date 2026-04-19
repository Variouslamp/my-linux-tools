import QtQuick
import Quickshell
import Quickshell.Io

ShellRoot {
    PanelWindow {
        anchors { top: true; left: true; right: true }
        height: 40
        color: "#1e1e2e"
        exclusionMode: PanelWindow.Exclusive

        Text {
            anchors.centerIn: parent
            text: "SISTEMA LIMPIO | " + Qt.formatDateTime(new Date(), "hh:mm:ss")
            color: "#cdd6f4"
            font.pixelSize: 16
            font.family: "JetBrains Mono"
        }
        
        // Timer para que el reloj se mueva
        Timer {
            interval: 1000; running: true; repeat: true
            onTriggered: parent.children[0].text = "WAYBAR DE MENTIRAS | " + Qt.formatDateTime(new Date(), "hh:mm:ss")
        }
    }
}
