import QtQuick 2.0

import "../Videos"

BaseCharacter {
    id: iAngel

    visible: true

    pXYWH: [100, 50, 50, 50]
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
    }
    BasicVideo {
        id: iAngelVideo3
        objectName: "Angel: Confront"
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

    function makeVideo1Available() {
        iAngelVideo1.pAvailable = true
    }
    function makeVideo2Available() {
        iAngelVideo2.pAvailable = true
    }
    function makeVideo3Available() {
        iAngelVideo3.pAvailable = true
    }
    function makeVideo4Available() {
        iAngelVideo4.pAvailable = true
    }
}

