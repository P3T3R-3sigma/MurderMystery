import QtQuick
import Felgo

import "../../Controll"
import "../"

BaseView {
    id: iBigStorageRoom
    objectName: "Big Storage Room"
    pImageSource: "BigStorageRoom.png"
    pBackView: mBarView

    NavigationRect {
        xPercent: 0.73
        yPercent: 0.47
        widthPercent: 0.08
        heightPercent: 0.25
        functionOnClicked: function() {mFreezer.startFadeIn()}
    }

    Freezer {
        id: mFreezer
    }

    Component.onCompleted: mPlaceManager.addPlace(this)

}
