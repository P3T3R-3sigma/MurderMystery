import QtQuick 2.0

import "../Videos"

BaseCharacter {
    id: iAngel

    visible: true

    pXYWH: [1525, 625, 150, 250]
    pColor: "red"
    pName: "Angel"
    pListVideos: [iAngelVideo1, iAngelVideo2, iAngelVideo3, iAngelVideo4]

    BasicVideo {
        id: iAngelVideo1
        objectName: "Angel: No Video"
        pAvailable: true
    }
    BasicVideo {
        id: iAngelVideo2
        objectName: "Angel: Stolen money"
        pAvailable: mConstants.closetAngelOpened
        pSource: "../../../assets/testVideo/C01_Alex_Angel_Briefcase.mov"
    }
    BasicVideo {
        id: iAngelVideo3
        objectName: "Angel: Confront"
        pAvailable: mConstants.diaryAngelPickedUp
        pSource: "../../../assets/testVideo/C02_Alex - angel - Briefcase - Variation 2 - New AI voice.mp4"
    }
    BasicVideo {
        id: iAngelVideo4
        objectName: "Angel: SEX"
    }


    Component.onCompleted: {
        iAngelVideo3.sVideoEnd.connect(playedVideo3)
    }

    function playedVideo3() {
        makeVideo4Available()
    }
    function makeVideo4Available() {
        iAngelVideo4.pAvailable = true
    }
}

