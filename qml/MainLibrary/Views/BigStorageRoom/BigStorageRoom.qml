import QtQuick
import Felgo

import "../../Controll"
import "../"

BaseView {
    id: iBigStorageRoom
    objectName: "Big Storage Room"
    pBackView: mBarView

    NavigationRect {
        pXYWH: [1410, 510, 160, 250]

        functionOnClicked: function() {mFreezer.startFadeIn()}
    }

    Freezer {
        id: mFreezer
    }

    Component.onCompleted: mPlaceManager.addPlace(this)

}
