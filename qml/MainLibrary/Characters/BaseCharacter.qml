import QtQuick 2.0

import "../Interact"

InteractCharacter {
    id: baseCharacter

    property var pVideoToPlay
    property var pListVideos: null
    property var pXYWH: [100, 100, 100, 100]
    property string pColor: "red"
    property string pName: ""

    Component.onCompleted: {
        mCharacterManager.addCharacter(baseCharacter)
        setNextAvailable()
    }

    function setNextAvailable() {
        let next = 0
        for (let i=1; i<pListVideos.length; i++) {
            if (pListVideos[i].pAvailable) {
                next = i
                break
            }
        }
        pVideoToPlay = pListVideos[next]
    }

}
