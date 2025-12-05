import QtQuick
import Felgo

import "../../Controll"
import "../"

BaseView {
    id: iMakeUpRoom
    objectName: "MakeUp Room"
    pImageSource: "MakeUpRoom.png"
    pBackView: mSideView

    NavigationRect {
        pXYWH: [50, 250, 180, 700]

        functionOnClicked: function() { startFadeOut(mVIP_Alcove) }
    }
    NavigationRect {
        pXYWH: [1725, 300, 135, 650]

        functionOnClicked: function() { startFadeOut(mChangingRoom) }
    }
    NavigationRect {
        pXYWH: [505, 620, 560, 220]

        functionOnClicked: function() { mMakeUpDesk.startFadeIn() }
    }

    MakeUpDesk {
        id: mMakeUpDesk
    }

    Component.onCompleted: mPlaceManager.addPlace(this)

}

