import Felgo
import QtQuick

Item {
    id: poly
    property real pAngle: 0
    property var pListText: []

    Rectangle {
        x: pCenter.x - width/2
        y: pCenter.y - width/2
        width: 200
        height: 200
        rotation: pAngle

        RotationText {
            anchors.left: parent.left
            anchors.top: parent.top
            pAngle: -45; pText: pListText[0]
        }
        RotationText {
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            pAngle: -135; pText: pListText[1]
        }
        RotationText {
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            pAngle: 135; pText: pListText[2]
        }
        RotationText {
            anchors.right: parent.right
            anchors.top: parent.top
            pAngle: 45; pText: pListText[3]
        }

        z: 1
    }
}
