import QtQuick 2.0

import "../Videos"

BaseCharacter {
    id: iRaul

    visible: true

    pXYWH: [800, 200, 200, 200]
    pColor: "red"
    pName: "Raul"

    pListVideos: [iRaulVideo1]


    BasicVideo {
        id: iRaulVideo1
        objectName: "Raul: First meeting"
        pAvailable: true
    }

    function makeVideo1Available() {
        iRaulVideo1.pAvailable = true
    }
}

