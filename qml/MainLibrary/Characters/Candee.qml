import QtQuick 2.0

import "../Videos"

BaseCharacter {
    id: iCandee

    visible: true

    pXYWH: [900, 520, 200, 200]
    pColor: "red"
    pName: "Candee"
    pListVideos: [iCandeeVideo1, iCandeeVideo2, iCandeeVideo3, iCandeeVideo4, iCandeeVideo5, iCandeeVideo6, iCandeeVideo7]

    BasicVideo {
        id: iCandeeVideo1
        objectName: "Candee: First meeting"
        pAvailable: true
    }
    BasicVideo {
        id: iCandeeVideo2
        objectName: "Candee: Drops Key"
        pAvailable: mConstants.heartLostTheKeys
    }
    BasicVideo {
        id: iCandeeVideo3
        objectName: "Candee: Confront"
        pAvailable: mConstants.murderVideoPickedUp
    }
    BasicVideo {
        id: iCandeeVideo4
        objectName: "Candee: Accept"
    }
    BasicVideo {
        id: iCandeeVideo5
        objectName: "Candee: Refuse"
    }
    BasicVideo {
        id: iCandeeVideo6
        objectName: "Candee: SEX + ARREST"
    }
    BasicVideo {
        id: iCandeeVideo7
        objectName: "Candee: ARREST"
    }

    Component.onCompleted: {
        iCandeeVideo2.sVideoEnd.connect(playedVideo2)
        iCandeeVideo3.sVideoEnd.connect(playedVideo3)
        iCandeeVideo4.sVideoEnd.connect(playedVideo4)
        iCandeeVideo5.sVideoEnd.connect(playedVideo5)
    }

    function playedVideo2() {
        mConstants.candeeDropedTheKey = true
    }
    function playedVideo3() {
        iCandeeVideo4.pAvailable = true
        iCandeeVideo5.pAvailable = true
    }
    function playedVideo4() {
        iCandeeVideo6.pAvailable = true
        iCandeeVideo5.pAvailable = false
    }
    function playedVideo5() {
        iCandeeVideo7.pAvailable = true
        iCandeeVideo4.pAvailable = false
    }
}

