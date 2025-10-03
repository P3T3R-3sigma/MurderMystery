import QtQuick 2.0

import "../Videos"

BaseCharacter {
    id: iCandee

    visible: true

    property bool pDropedKey: false

    pXYWH: [250, 50, 50, 50]
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
    }
    BasicVideo {
        id: iCandeeVideo3
        objectName: "Candee: Confront"
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
        pDropedKey = true
    }
    function playedVideo3() {
        makeVideo4Available()
        makeVideo5Available()
    }
    function playedVideo4() {
        makeVideo6Available()
    }
    function playedVideo5() {
        makeVideo7Available()
    }

    function makeVideo1Available() {
        iCandeeVideo1.pAvailable = true
    }
    function makeVideo2Available() {
        iCandeeVideo2.pAvailable = true
    }
    function makeVideo3Available() {
        iCandeeVideo3.pAvailable = true
    }
    function makeVideo4Available() {
        iCandeeVideo4.pAvailable = true
    }
    function makeVideo5Available() {
        iCandeeVideo5.pAvailable = true
    }
    function makeVideo6Available() {
        iCandeeVideo6.pAvailable = true
    }
    function makeVideo7Available() {
        iCandeeVideo7.pAvailable = true
    }
}

