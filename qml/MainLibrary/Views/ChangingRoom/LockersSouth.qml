import QtQuick
import Felgo

import "../"
import "../../Controll"

BaseView {
    id: iLockersSouth

    pImageSource: "LockersSouth.png"

    property bool pCandeeOpen: false

    NavigationRect {
        id: iCandeePadlock
        pXYWH: [630, 528, 50 ,50]

        pAdditionalEnable: !pCandeeOpen
        pSource: "Padlock.png"
        functionOnClicked: function() {pCandeeOpen = true }
    }
    NavigationRect {
        id: iCandeeLocker
        pXYWH: [630, 475, 55, 100]

        pAdditionalEnable: pCandeeOpen
        functionOnClicked: function() { mLockerCandee.startFadeIn() }
    }

    LockerCandee {
        id: mLockerCandee
        pBackView: iLockersSouth
        pCode: "ROOM" + pBaseCode + "C"
    }
}


