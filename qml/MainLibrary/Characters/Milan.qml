import QtQuick 2.0

import "../Videos"

BaseCharacter {
    id: iMilan

    visible: true

    pXYWH: [700, 50, 50, 50]
    pColor: "red"
    pName: "Milan"
    pListVideos: [iMilanVideo1, iMilanVideo2, iMilanVideo3]

    BasicVideo {
        id: iMilanVideo1
        objectName: "Milan: First talk"
        pAvailable: true
    }
    BasicVideo {
        id: iMilanVideo2
        objectName: "Milan: Confront"
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

