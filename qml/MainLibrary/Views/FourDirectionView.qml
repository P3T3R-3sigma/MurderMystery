import QtQuick
import Felgo

import "../Controll"

Item {
    id: iFourDirectionView

    property var pListDirections: []
    property int pIndex: 1
    property  string pBaseCode: ""

    visible: false
    anchors.fill: parent

    onPIndexChanged: {
        for (let i = 0; i < pListDirections.length; i++) {
            if (i === pIndex) {
                scene.mCurrentScene.startFadeOut(pListDirections[i])
            } else {
                pListDirections[i].visible = false
            }
        }
    }

    function startFadeIn(idx = 0) {
        iFourDirectionView.visible = true
        pListDirections[pIndex].startFadeIn()
        pIndex = idx
    }


    function changeRoom(room) {
        iFourDirectionView.visible = false
        room.startFadeIn(pIndex)
    }

    NavigationRect {
        id: goLeft
        pXYWH: [0, 0, 200, 1080]

        pEnabled: pListDirections[pIndex] === scene.mCurrentScene
        functionOnClicked: function() {
            if (pIndex === 0) {
                pIndex = 3
            } else {
                pIndex--
            }
        }
    }
    NavigationRect {
        id: goRight
        pXYWH: [1720, 0, 200, 1080]

        pEnabled: pListDirections[pIndex] === scene.mCurrentScene
        functionOnClicked: function() {
            if (pIndex === 3) {
                pIndex = 0
            } else {
                pIndex++
            }
        }
    }
}


