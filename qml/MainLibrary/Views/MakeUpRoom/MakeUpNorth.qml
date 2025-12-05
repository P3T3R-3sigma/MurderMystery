import QtQuick
import Felgo

import "../"
import "../../Controll"

BaseView {
    id: iMakeUpNorth


    NavigationRect {
        pXYWH: [505, 620, 560, 220]

        functionOnClicked: function() { mMakeUpDesk.startFadeIn() }
    }

    MakeUpDesk {
        id: mMakeUpDesk

        pBackView: iMakeUpNorth
        pCode: "ROOM" + pBaseCode + "D"
    }

}


