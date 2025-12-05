import QtQuick
import Felgo

import "../../Controll"
import "../../Characters"
import "../"

Item {
    id: iVIP_Alcove
    anchors.fill: parent
    objectName: "VIP Alcove"
    visible: false

    Raul { id: mRaul}


    function startFadeIn(idx = 0) {
        iVIP_Alcove.visible = true
        scene.mCurrentScene = iVIP_Alcove
        mRaul.enterVIP()
    }

    function changeRoom() {
        iVIP_Alcove.visible = false
        mMainRoom.startFadeIn(0)
    }

    Component.onCompleted: mPlaceManager.addPlace(this)

}

