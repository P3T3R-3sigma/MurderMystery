import QtQuick
import Felgo

import "../../Controll"
import "../"

BaseView {
    id: iMakeUpRoom
    objectName: "MakeUp Room"
    pImageSource: "MakeUpRoom.png"

    NavigationRect {
        xPercent: 0.03
        yPercent: 0.29
        widthPercent: 0.1
        heightPercent: 0.55
        functionOnClicked: function() { startFadeOut(mVIP_Alcove) }
    }
    NavigationRect {
        xPercent: 0.895
        yPercent: 0.29
        widthPercent: 0.08
        heightPercent: 0.55
        functionOnClicked: function() { startFadeOut(mChangingRoom) }
    }
    NavigationRect {
        xPercent: 0.27
        yPercent: 0.58
        widthPercent: 0.3
        heightPercent: 0.2
        functionOnClicked: function() { mMakeUpDesk.startFadeIn() }
    }

    MakeUpDesk {
        id: mMakeUpDesk
    }
    Cabinet {
        id: mMakeUpCabinet
    }

    Component.onCompleted: mPlaceManager.addPlace(this)

}

