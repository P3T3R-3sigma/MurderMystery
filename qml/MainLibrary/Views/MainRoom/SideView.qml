import QtQuick
import Felgo

import "../../Controll"
import "../../Characters"
import "../../Items"
import "../..//Puzzle/MagnetGame"
import "../"

BaseView {
    id: iMainRoomSideView
    objectName: "Main Room SideView"
    pImageSource: "MainRoomSideView.png"
    pBackView: mMainRoom

    NavigationRect {
        xPercent: 0.05
        yPercent: 0.065
        widthPercent: 0.185
        heightPercent: 0.55
        functionOnClicked: function() {startFadeOut(mVIP_Alcove) }
    }
    NavigationRect {
        xPercent: 0.795
        yPercent: 0.1
        widthPercent: 0.125
        heightPercent: 0.52
        functionOnClicked: function() {startFadeOut(mMakeUpRoom) }
    }

    NavigationRect {
        xPercent: 0.305
        yPercent: 0.63
        widthPercent: 0.065
        heightPercent: 0.11
        visible: mConstants.candeeDropedTheKey && !mConstants.greenKeyPickedUp
        pEnabled: mConstants.magnetHookPickedUp
        functionOnClicked: function() {mMagnetGame.startFadeIn() }
    }

    Candee { id: mCandee }

    KeyGreen {
        id: mKeyGreen
        visible: false
    }

    MagnetGame { id: mMagnetGame }

    Component.onCompleted: mPlaceManager.addPlace(this)

}

