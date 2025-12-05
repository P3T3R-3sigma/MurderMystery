import Felgo
import QtQuick

Item {
    id: rotationObj

    property real baseAngle: 0
    property real pWidth: pRadius*Math.sin(Math.PI/8)*2
    property real pRadius: 100
    property int pCorrectRotation: 0
    property bool pCorrect: baseAngle === pCorrectRotation
    property var pListLetters: []
    property var pCenter: Qt.point(500, 500)

    RotationRect {pAngle: baseAngle; pListText: pListLetters.filter((item, index) => index % 2 === 1)}
    RotationRect {pAngle: baseAngle + 45; pListText: pListLetters.filter((item, index) => index % 2 === 0)}

    Rectangle {
        x: pCenter.x-width/2
        y: pCenter.y-pRadius-width + 5
        width: 40
        height: width
        color: "transparent"
        border{
            width: 2
            color: "red"
        }
    }
    Rectangle {
        x: pCenter.x - width/2
        y: pCenter.y - height/2
        width: 70
        height: width
        radius: width/2
        color: "blue"
        MouseArea {
            anchors.fill: parent
            onClicked: rotate()
        }
    }

    NumberAnimation {
        id: rotationAnimation
        target: rotationObj
        property: "baseAngle"
        to: baseAngle + 45
        duration: 500
        onFinished: {
            if (baseAngle === 360) {
                baseAngle = 0
            }
        }
    }

    function rotate() {
        rotationAnimation.start()
    }

    function setCorrect() {
        pCorrectRotation = baseAngle
    }
}
