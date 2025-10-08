import QtQuick 2.0

import "../Interact"

InteractCharacter {
    id: baseCharacter

    property var pVideoToPlay
    property var pListVideos: null
    property var pXYWH: [100, 100, 100, 100]
    property string pColor: "orange"
    property string pName: ""

    Rectangle {
        id: iRect
        x: pXYWH[0]
        y: pXYWH[1]
        width: pXYWH[2]
        height: pXYWH[3]
        color: pColor

        Text {
            id: iText
            anchors.centerIn: parent
            text: pName
            font.pixelSize: 50
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                pVideoToPlay.onInteract()
                iText.text = pVideoToPlay.objectName
                iText.font.pixelSize = 20
                iRect.color = "purple"
                iTimer.start()
            }
        }
    }

    Timer {
        id: iTimer
        interval: 3000
        onTriggered: {
            iRect.color = "red"
            iText.text = pName
            iText.font.pixelSize = 50
            mMainManager.updateAll()
        }
    }

    Component.onCompleted: {
        mCharacterManager.addCharacter(baseCharacter)
        setNextAvailable()
    }

    function setNextAvailable() {
        let next = 0
        for (let i=1; i<pListVideos.length; i++) {
            if (pListVideos[i].pAvailable && !pListVideos[i].pVisited) {
                next = i
                break
            }
        }
        pVideoToPlay = pListVideos[next]
    }

}
