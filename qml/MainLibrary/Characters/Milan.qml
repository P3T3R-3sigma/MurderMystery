import QtQuick 2.0

import "../Videos"

BaseCharacter {
    id: iMilan

    visible: true

    pXYWH: [680, 500, 100, 200]
    pColor: "red"
    pName: "Milan"
    pListVideos: [iMilanVideo1, iMilanVideo2, iMilanVideo3, iMilanVideo0]

    BasicVideo {
        id: iMilanVideo1
        objectName: "Milan: No Video"
        pAvailable: true
        pSource: ""
    }
    BasicVideo {
        id: iMilanVideo0
        objectName: "Milan: Different suspects"
        pAvailable: true
        pSource: "../../../assets/testVideo/C09_Alex_Milan_Hearts_Interrogating.mov"
    }
    BasicVideo {
        id: iMilanVideo2
        objectName: "Milan: Confront"
        pAvailable: mConstants.milanBlackmailSeen
        pSource: "../../../assets/testVideo/C07_I found your little secret.mp4"
    }
    BasicVideo {
        id: iMilanVideo3
        objectName: "Milan: SEX"
    }

    Component.onCompleted: {
        iMilanVideo2.sVideoEnd.connect(playedVideo2)
    }

    function playedVideo2() {
        makeVideo3Available()
    }

    function makeVideo1Available() {
        iMilanVideo1.pAvailable = true
    }
    function makeVideo2Available() {
        iMilanVideo2.pAvailable = true
    }
    function makeVideo3Available() {
        iMilanVideo3.pAvailable = true
    }
}

