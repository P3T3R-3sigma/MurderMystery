import Felgo
import QtQuick

import "RotationObject"

Item {
    id: iPadlockGame
    anchors.fill: parent

    property var pFunctionToDo
    property var pCorrect: []
    property var pListListletters: []
    property bool pWin: false

    visible: false

    Rectangle {
        id: iLock
        anchors.fill: parent
        color: "black"
        opacity: 0.5
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {}
        }
    }

    RotationObject { id: rotate1; pCenter: ({ x: 360,  y: 500 }); pListLetters: pListListletters[0] }
    RotationObject { id: rotate2; pCenter: ({ x: 660,  y: 500 }); pListLetters: pListListletters[1] }
    RotationObject { id: rotate3; pCenter: ({ x: 960,  y: 500 }); pListLetters: pListListletters[2] }
    RotationObject { id: rotate4; pCenter: ({ x: 1260, y: 500 }); pListLetters: pListListletters[3] }
    RotationObject { id: rotate5; pCenter: ({ x: 1560, y: 500 }); pListLetters: pListListletters[4] }

    Timer {
        id: iTimer
        interval: 2000
        onTriggered: {
            if (pWin) {
                pFunctionToDo()
                iPadlockGame.visible = false
            } else {
                iLock.color = "black"
            }
        }
    }

    AppButton {
        x: 960-width/2
        y: 700
        text: "Open"
        onClicked: checkCorrect()
    }
    function checkCorrect() {
        if (rotate1.pCorrect && rotate2.pCorrect && rotate3.pCorrect && rotate4.pCorrect && rotate5.pCorrect) {
            iLock.color = "green"
            pWin = true
        } else {
            iLock.color = "red"
        }
        iTimer.start()
    }


    function startFadeIn() {
        this.visible = true
    }

    function setSolution() {
        rotate1.setCorrect()
        rotate2.setCorrect()
        rotate3.setCorrect()
        rotate4.setCorrect()
        rotate5.setCorrect()
    }

    Component.onCompleted: {
        rotate1.baseAngle = 45 * pCorrect[0]
        rotate2.baseAngle = 45 * pCorrect[1]
        rotate3.baseAngle = 45 * pCorrect[2]
        rotate4.baseAngle = 45 * pCorrect[3]
        rotate5.baseAngle = 45 * pCorrect[4]
        setSolution()
        rotate1.baseAngle = 0
        rotate2.baseAngle = 0
        rotate3.baseAngle = 0
        rotate4.baseAngle = 0
        rotate5.baseAngle = 0
    }
}
