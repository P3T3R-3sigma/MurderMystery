import QtQuick
import Felgo

import "../../Controll"
import "../../Characters"
import "../"

BaseView {
    id: iMainRoom
    objectName: "Main Room"
    pImageSource: "MainRoom.png"

    NavigationRect {
        xPercent: 0
        yPercent: 0.47
        widthPercent: 0.3
        heightPercent: 0.4
        functionOnClicked: function() { startFadeOut(mSideView) }
    }
    NavigationRect {
        xPercent: 0.63
        yPercent: 0.3
        widthPercent: 0.35
        heightPercent: 0.4
        functionOnClicked: function() { startFadeOut(mBarView) }
    }
    NavigationRect {
        xPercent: 0.55
        yPercent: 0.5
        widthPercent: 0.05
        heightPercent: 0.2
        functionOnClicked: function() { startFadeOut(mBossRoom) }
    }


    Angel { id: mAngel }

    Component.onCompleted: mPlaceManager.addPlace(this)

}

