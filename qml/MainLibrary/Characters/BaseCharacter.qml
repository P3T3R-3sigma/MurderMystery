import QtQuick 2.0

import "../Interact"

InteractCharacter {
    id: baseCharacter

    property var pVideoToPlay
    property var pListVideos: null
    property var pXYWH: [100, 100, 100, 100]
    property string pColor: "red"
    property string pName: ""

    onPVideoToPlayChanged: pVideoToPlay.color = "purple"

    Rectangle {
        id: body

        x: pXYWH[0]
        y: pXYWH[1]
        width: pXYWH[2]
        height: pXYWH[3]
        color: pColor

        Text {
            anchors.fill: parent

            text: pName
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                interact(pVideoToPlay)
            }
        }
    }

    Repeater {
        id: iRepeater
        model: pListVideos.length

        Rectangle {
            id: video

            x: pXYWH[0] -50 + 10
            y: pXYWH[1] + index*40 + 70
            width: pXYWH[2] + 100 - 20
            height: pXYWH[3] - 20
            color: pColor

            Text {
                text: pListVideos[index].objectName
            }

            function start() {
                if (index !== 0) {
                    pListVideos[index].pAvailable = false
                    pListVideos[index].pVisited = true
                }
                pListVideos[index].onInteract()
                mMainManager.updateAll()
            }
        }
    }


    Component.onCompleted: {
        mCharacterManager.addCharacter(baseCharacter)
        setNextAvailable()
    }

    function setNextAvailable() {
        let next = 0
        for (let i=1; i<pListVideos.length; i++) {
            if (pListVideos[i].pAvailable) {
                console.log(pListVideos[i].pAvailable, pListVideos[i].pVisited, i)
                next = i
                break
            }
        }
        setVisual()
        pVideoToPlay = iRepeater.itemAt(next)
    }

    function setVisual() {
        for (let i=0; i<pListVideos.length; i++) {
            if (pListVideos[i].pAvailable) {
                iRepeater.itemAt(i).color = "green"
            } else if (pListVideos[i].pVisited) {
                iRepeater.itemAt(i).color = "blue"
            } else {
                iRepeater.itemAt(i).color = "red"
            }
        }
    }
}
