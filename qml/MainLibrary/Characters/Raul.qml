import QtQuick 2.0

import "../Videos"

BaseCharacter {
    id: iRaul

    pXYWH: [800, 200, 200, 200]
    pColor: "red"
    pName: "Raul"

    pListVideos: [iRaulVideo1]


    BasicVideo {
        id: iRaulVideo1
        objectName: "Raul: First meeting"
        pAvailable: true
        pSource: "../../../assets/testVideo/C14_Raul interrogated.mp4"
    }

    Component.onCompleted: {
        iRaulVideo1.sVideoEnd.connect(exitVIP)
    }

    function exitVIP() {
        scene.mCurrentScene.changeRoom()
    }
    function enterVIP() {
        iRaulVideo1.visible = true
    }
}

