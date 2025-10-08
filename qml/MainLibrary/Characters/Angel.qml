import QtQuick 2.0

import "../Videos"

BaseCharacter {
    id: iAngel

    visible: true

    pXYWH: [800, 500, 200, 200]
    pColor: "red"
    pName: "Angel"
    pListVideos: [iAngelVideo1, iAngelVideo2, iAngelVideo3, iAngelVideo4]

    BasicVideo {
        id: iAngelVideo1
        objectName: "Angel: First meeting"
        pAvailable: true
    }
    BasicVideo {
        id: iAngelVideo2
        objectName: "Angel: Stolen money"
        pAvailable: mConstants.closetAngelOpened
    }
    BasicVideo {
        id: iAngelVideo3
        objectName: "Angel: Confront"
        pAvailable: mConstants.diaryAngelPickedUp
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

