import QtQuick
import Felgo

import "../"
import "../../Controll"

BaseView {
    id: iLockersEast

    pImageSource: "LockersEast.png"

    property bool pAngelOpen: false

    NavigationRect {
        id: iAmyLocker
        pXYWH: [895, 350, 55, 100]

        functionOnClicked: function() { console.log("Can't open, but looks like she has been robbed.") }
    }
    NavigationRect {
        id: iAngelPadlock
        pXYWH: [1110, 407, 50 ,50]

        pAdditionalEnable: !pAngelOpen
        pSource: "Padlock.png"
        functionOnClicked: function() { pAngelOpen = true }
    }
    NavigationRect {
        pXYWH: [1105, 350, 55, 100]

        id: iAngelLocker
        pAdditionalEnable: pAngelOpen
        functionOnClicked: function() { mConstants.closetAngelOpened = true; mMainManager.updateAll(); mLockerAngel.startFadeIn() }
    }

    LockerAngel {
        id: mLockerAngel
        pBackView: iLockersEast
        pCode: "ROOM" + pBaseCode + "A"
    }
}


