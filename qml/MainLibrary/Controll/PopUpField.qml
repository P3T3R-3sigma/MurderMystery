import QtQuick
import Felgo

Item {
    id: iPopUpField

    anchors.fill: parent
    visible: false

    property string pText: "No Text specified!!!"

    Rectangle {
        anchors.fill: parent
        color: "black"
        opacity: 0.5
        z: -1
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {}
        }
    }

    Rectangle {
        x: 1920/2-width/2
        y: 400
        width: 500
        height: 400
        Text {
            id: iText
            anchors.centerIn: parent
            padding: 20
            text: pText
            font.pixelSize: 34
            wrapMode: Text.WordWrap
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            y: 300
            padding: 20
            text: "Close"
            font.pixelSize: 40
            wrapMode: Text.WordWrap
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    iPopUpField.visible = false
                }
            }
        }
    }
}
