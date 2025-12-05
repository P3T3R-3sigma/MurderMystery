import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

BaseView {
    id: iOfficeEast

    PictureOnWall {
        id: mPictureOnWall
        pBackView: iOfficeEast
        pCode: "ROOM" + pBaseCode + "P"
    }

    NavigationRect {
        pXYWH: [705, 310, 255, 360]

        functionOnClicked: function() { mPictureOnWall.startFadeIn()}
    }
}


