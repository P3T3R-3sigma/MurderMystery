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
        pXYWH: [315, 155, 235, 500]

        functionOnClicked: function() { startFadeOut(mBigStorageRoom) }
    }

    Milan { id: mMilan }
    Heart { id: mHeart }


    Component.onCompleted: mPlaceManager.addPlace(this)

}

