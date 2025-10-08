import QtQuick 2.0

import "../Videos"

BaseCharacter {
    id: iCosta

    visible: true

    pXYWH: [400, 200, 200, 200]
    pColor: "red"
    pName: "Costa"
    pListVideos: [iCostaVideo1, iCostaVideo2]


    BasicVideo {
        id: iCostaVideo1
        objectName: "Costa: Nothing else"
        pAvailable: true
    }
    BasicVideo {
        id: iCostaVideo2
        objectName: "Costa: Gives videos"
        pAvailable: true
    }

    Component.onCompleted: {
        iCostaVideo2 .sVideoEnd.connect(playedVideo2)
    }

    function playedVideo2() {
        mConstants.gotVideosFromCosta = true
    }
}

