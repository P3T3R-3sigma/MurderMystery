import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

BaseView {
    id: iOfficeWest

    NavigationRect {
        pXYWH: [630, 650, 800, 350]
        pEnabled: parent.pEnabled

        functionOnClicked: function() { mDeskOfHeart.startFadeIn()}
    }
    DeskOfHearts {
        id: mDeskOfHeart
        pBackView: iOfficeWest
        pCode: "ROOM01D"
    }



}


