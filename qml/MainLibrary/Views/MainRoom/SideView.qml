import QtQuick
import Felgo

import "../../Controll"
import "../../Characters"
import "../../Items"
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

    KeyGreen {
        id: mKeyGreen
        xPercent: 0.32
        yPercent: 0.9
        widthPercent: 0.03
        heightPercent: 0.055
        visible: mConstants.candeeDropedTheKey && !pPickedUp
        pEnabled: mConstants.magnetHookPickedUp
    }

    Candee { id: mCandee }

    Component.onCompleted: mPlaceManager.addPlace(this)

}

