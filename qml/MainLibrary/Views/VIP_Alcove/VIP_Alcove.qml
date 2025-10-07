import QtQuick
import Felgo

import "../../Controll"
import "../"

BaseView {
    id: iVIP_Alcove
    objectName: "VIP Alcove"
    pImageSource: "VIP_Alcove.png"

    NavigationRect {
        xPercent: 0.77
        yPercent: 0.28
        widthPercent: 0.1
        heightPercent: 0.5
        functionOnClicked: function() { startFadeOut(mMakeUpRoom) }
    }


    Component.onCompleted: mPlaceManager.addPlace(this)

}

