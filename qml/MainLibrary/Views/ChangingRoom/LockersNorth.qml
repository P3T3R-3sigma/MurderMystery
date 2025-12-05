import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Puzzle/PadlockGame"
import "../../Videos"

BaseView {
    id: iLockersNorth

    pImageSource: "LockersNorth.png"

    property bool pMilanOpen: false

    NavigationRect {
        id: iMilanPadlock
        pXYWH: [1240, 530, 50 ,50]

        pAdditionalEnable: !pMilanOpen
        pSource: "Padlock.png"
        functionOnClicked: function() {
            if (iMilanVideo2.pAvailable) {
                iMilanVideo2.visible = true
                iMilanVideo2.pAvailable = false
            } else {
                mMilanGame.startFadeIn()
            }
        }
    }
    NavigationRect {
        id: iMilanLocker
        pXYWH: [1237, 480, 55, 100]

        pAdditionalEnable: pMilanOpen
        functionOnClicked: function() {mLockerMilan.startFadeIn() }
    }
    LockerMilan {
        id: mLockerMilan
        pBackView: iLockersNorth
        pCode: "ROOM" + pBaseCode + "M"
    }
    BasicVideo {
        id: iMilanVideo2
        objectName: "Milan: Locker"
        pAvailable: true
        pSource: "../../../assets/testVideo/C08_Mysterious Closet - Alex-Milan.mp4"
    }
    PadlockGame {
        id: mMilanGame

        pCorrect: [0, 0, 0, 0, 0]
        pListListletters: [
            ["M", "B", "C", "D", "E", "F", "G", "H"],
            ["I", "B", "C", "D", "E", "F", "G", "H"],
            ["L", "B", "C", "D", "E", "F", "G", "H"],
            ["A", "B", "C", "D", "E", "F", "G", "H"],
            ["N", "B", "C", "D", "E", "F", "G", "K"],
        ]
        pFunctionToDo: function() {
            pMilanOpen = true
            mConstants.closetMilanOpened = true;
        }
    }


    NavigationRect {
        pXYWH: [365, 200, 250, 600]

        functionOnClicked: function() { iBaseLockers.changeRoom(mMakeUpRoom) }
    }

}


