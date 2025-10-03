import QtQuick 2.0

import "../Videos"

BaseCharacter {
    id: iRaul

    visible: true

    pXYWH: [850, 50, 50, 50]
    pColor: "red"
    pName: "Raul"

    pListVideos: [iRaulVideo1, iRaulVideo2, iRaulVideo3]


    BasicVideo {
        id: iRaulVideo1
        objectName: "Raul: First meeting"
        pAvailable: true
    }
    BasicVideo {
        id: iRaulVideo2
        objectName: "Raul: Key in pocket"
    }
    BasicVideo {
        id: iRaulVideo3
        objectName: "Raul: Get key"
    }

    Component.onCompleted: {
        iRaulVideo2.sVideoEnd.connect(playedVideo2)
        iRaulVideo3.sVideoEnd.connect(playedVideo3)
    }

    function playedVideo2() {
        makeVideo3Available()
    }
    function playedVideo3() {
        mKeyRed.pPickedUp = true
    }

    function makeVideo1Available() {
        iRaulVideo1.pAvailable = true
    }
    function makeVideo2Available() {
        if (!iRaulVideo2.pVisited) {
        iRaulVideo2.pAvailable = true
        }
    }
    function makeVideo3Available() {
        iRaulVideo3.pAvailable = true
    }
}

