import Felgo 4.0
import QtQuick 2.0

import "../Physics"

Item {
    id: iMagnetHook
    anchors.fill: parent

    property string pColor: "red"

    // Visual elements
    Rectangle {
        id: pivot
        x: mPhysics.pivotX - 15
        y: mPhysics.pivotY - 15
        width: 30
        height: 30
        radius: 15
        color: "blue"
        MouseArea {
            anchors.fill: parent

            onMouseXChanged: function(mouse) {
                mPhysics.pivotX += mouse.x - pivot.radius
            }
        }
    }
    Text {
        x: mPhysics.pivotX - width/2
        y: parent.height * 0.01
        text: "Drag"
        font.pixelSize: 20
        z: 2
    }

    Rectangle {
        x: mPhysics.pivotX + 100
        y: mPhysics.pivotY - 15
        width: 30
        height: 30
        radius: 15
        color: "green"
        MouseArea {
            anchors.fill: parent

            onPressed: {
                mPhysics.increaseLength = true
            }
            onReleased: {
                mPhysics.increaseLength = false
            }
        }
    }
    Text {
        x: mPhysics.pivotX - width/2 - 115
        y: parent.height * 0.01
        text: "Up"
        font.pixelSize: 20
        z: 2
    }
    Rectangle {
        x: mPhysics.pivotX -130
        y: mPhysics.pivotY - 15
        width: 30
        height: 30
        radius: 15
        color: "red"
        MouseArea {
            anchors.fill: parent

            onPressed: {
                mPhysics.decreaseLength = true
            }
            onReleased: {
                mPhysics.decreaseLength = false
            }
        }
    }
    Text {
        x: mPhysics.pivotX - width/2 + 115
        y: parent.height * 0.01
        text: "Down"
        font.pixelSize: 20
        z: 2
    }
    // String (line approximated by thin rect)
    Rectangle {
        x: mPhysics.pivotX
        y: mPhysics.pivotY
        width: 2
        height: mPhysics.l
        color: "yellow"
        transform: [
            Translate { y: 0 },
            Rotation {
                origin.x: 0
                origin.y: 0
                angle: -mPhysics.theta * 180 / Math.PI
            }
        ]
    }
}
