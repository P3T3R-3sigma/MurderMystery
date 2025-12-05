import Felgo
import QtQuick

Rectangle {
    id: iRotationText

    property string pText: ""
    property real pAngle: 0

    width: 40
    height: 40
    color: "transparent"
    transform: Rotation { origin.x: 20; origin.y: 20; angle: pAngle}

    Text {
        id: iText
        anchors.centerIn: parent

        text: qsTr(pText)
        font.pixelSize: 32
    }
}
