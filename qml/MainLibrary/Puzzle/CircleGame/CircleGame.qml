import Felgo
import QtQuick

import "Objects"

Item {
    id: iTestGame

    property bool pEnable: true
    anchors.fill: parent
    visible: false

    Rectangle {
        id: iBackgraound
        anchors.fill: parent
        color: "gray"
        z: -1
    }

    BaseObject {
        id: iInner
        pSource: "Inner"
        pRotation: 0
    }
    BaseObject {
        id: iMiddle
        pSource: "middle"
        pRotation: -60
    }
    BaseObject {
        id: iOuter
        pSource: "outer"
        pRotation: 30
    }
    BaseObject {
        id: iBase
        pSource: "base"
    }


    Rectangle {
        x: 100
        y: 100
        width: 100
        height: 100
        radius: width/2
        color: "green"

        MouseArea {
            anchors.fill: parent
            enabled: pEnable
            onClicked: {
                iMiddle.rotate(-1)
                iInner.rotate(1)
            }
        }
    }
    Rectangle {
        x: 100
        y: 300
        width: 100
        height: 100
        radius: width/2
        color: "blue"

        MouseArea {
            anchors.fill: parent
            enabled: pEnable
            onClicked: {
                iOuter.rotate(-1)
                iMiddle.rotate(-1)
            }
        }
    }
    Rectangle {
        x: 100
        y: 500
        width: 100
        height: 100
        radius: width/2
        color: "red"

        MouseArea {
            anchors.fill: parent
            enabled: pEnable
            onClicked: {
                iOuter.rotate(2)
                iInner.rotate(-1)
            }
        }
    }

    Timer {
        id: waitTimer
        interval: 1000
        onTriggered: {
            pSafeOpen = true
            calculateImage()
            iTestGame.visible = false
        }
    }

    function win() {
        if (iInner.rotation%360 === 0 && iMiddle.rotation%360 === 0 && iOuter.rotation%360 === 0) {
            iBackgraound.color = "gold"
            pEnable = false
            waitTimer.start()
        }
    }

    function startFadeIn() {
        this.visible = true
    }

}
