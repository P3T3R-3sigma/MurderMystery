import QtQuick
import Felgo

import "../../Controll"
import "../../Characters"
import "../"

BaseView {
    id: iMainRoomBarView
    objectName: "Main Room BarView"
    pImageSource: "MainRoomBarView.png"
    pBackView: mMainRoom


    NavigationRect {
        xPercent: 0.163
        yPercent: 0.14
        widthPercent: 0.122
        heightPercent: 0.45
        functionOnClicked: function() { startFadeOut(mBigStorageRoom) }
    }

    Milan { id: mMilan }
    Heart { id: mHeart }


    Component.onCompleted: mPlaceManager.addPlace(this)

}

