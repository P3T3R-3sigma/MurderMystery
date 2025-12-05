import QtQuick 2.0

import "../Videos"

BaseCharacter {
    id: iCandee

    visible: true

    pXYWH: [1000, 550, 150, 500]
    pColor: "red"
    pName: "Candee"
    pListVideos: [iCandeeVideo1, iCandeeVideo2, iCandeeVideo3, iCandeeVideo4, iCandeeVideo5, iCandeeVideo6, iCandeeVideo7]

    BasicVideo {
        id: iCandeeVideo1
        objectName: "Candee: No Video"
        pAvailable: false
    }
    BasicVideo {
        id: iCandeeVideo2
        objectName: "Candee: Drops Key"
        pAvailable: mConstants.heartLostTheKeys
        pSource: "../../../assets/testVideo/C05_Key to hairdresser - Alex-candee.mp4"
    }
    BasicVideo {
        id: iCandeeVideo3
        objectName: "Candee: Confront"
        pAvailable: mConstants.murderVideoPickedUp
        pSource: "../../../assets/testVideo/C03_Candee arrest- Alex-candee.mp4"
    }
    BasicVideo {
        id: iCandeeVideo4
        objectName: "Candee: Accept"
        pSource: "../../../assets/testVideo/C04_Candee arrest variation 2- Alex-candee.mp4"
    }
    BasicVideo {
        id: iCandeeVideo5
        objectName: "Candee: Refuse"
        pSource: "../../../assets/testVideo/C03_Candee arrest- Alex-candee.mp4"
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

