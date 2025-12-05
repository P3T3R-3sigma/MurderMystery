import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

BaseView {
    id: iOfficeSouth

    NavigationRect {
        pXYWH: [310, 390, 235, 550]

        functionOnClicked: function() { startFadeOut(mMainRoom) }
    }
    NavigationRect {
        pXYWH: [1225, 400, 635, 550]

        functionOnClicked: function() { mComputerView.startFadeIn() }
    }

    OfficeComputerView {
        id: mComputerView
        pBackView: iOfficeSouth
        pCode: "ROOM" + pBaseCode + "C"
    }
}


