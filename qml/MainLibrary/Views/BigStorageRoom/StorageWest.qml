import QtQuick
import Felgo

import "../"
import "../../Controll"

BaseView {
    id: iStorageWest

    NavigationRect {
        pXYWH: [775, 510, 145, 290]

        functionOnClicked: function() {mFreezer.startFadeIn()}
    }

    Freezer {
        id: mFreezer
        pBackView: iStorageWest
        pCode: "ROOM" + pBaseCode + "F"
    }

}


