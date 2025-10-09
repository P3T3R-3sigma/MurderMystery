import QtQuick 2.0

import "../Videos"

BaseCharacter {
    id: iHeart

    visible: true

    pXYWH: [1150, 300, 200, 200]
    pColor: "red"
    pName: "Heart"

    pListVideos: [iHeartVideo1, iHeartVideo2, iHeartVideo3, iHeartVideo4, iHeartVideo5, iHeartVideo6, iHeartVideo7]


    BasicVideo {
        id: iHeartVideo1
        objectName: "Heart: First meeting"
        pAvailable: true
    }
    BasicVideo {
        id: iHeartVideo2
        objectName: "Heart: Missing Key"
        pAvailable: mConstants.videoMissing
    }
    BasicVideo {
        id: iHeartVideo3
        objectName: "Heart: Confront"
        pAvailable: mConstants.blackMailVideoPickedUp
    }
    BasicVideo {
        id: iHeartVideo4
        objectName: "Heart: Accept"
    }
    BasicVideo {
        id: iHeartVideo5
        objectName: "Heart: Refuse"
    }
    BasicVideo {
        id: iHeartVideo6
        objectName: "Heart: SEX accept"
    }
    BasicVideo {
        id: iHeartVideo7
        objectName: "Heart: SEX refuse"
    }

    Component.onCompleted: {
        iHeartVideo2.sVideoEnd.connect(playedVideo2)
        iHeartVideo3.sVideoEnd.connect(playedVideo3)
        iHeartVideo4.sVideoEnd.connect(playedVideo4)
        iHeartVideo5.sVideoEnd.connect(playedVideo5)
    }

    function playedVideo2() {
        mConstants.heartLostTheKeys = true
    }
    function playedVideo3() {
        iHeartVideo4.pAvailable = true
        iHeartVideo5.pAvailable = true
    }
    function playedVideo4() {
        iHeartVideo6.pAvailable = true
        iHeartVideo5.pAvailable = false
    }
    function playedVideo5() {
        iHeartVideo7.pAvailable = true
        iHeartVideo4.pAvailable = false
    }
}

