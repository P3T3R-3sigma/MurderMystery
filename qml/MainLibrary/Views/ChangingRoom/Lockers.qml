import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Puzzle/PadlockGame"
import "../../Videos"

BaseView {
    id: iLockers

    property bool pMilanOpen: false
    property bool pAmyOpen: false
    property bool pAngelOpen: false
    property bool pCandeeOpen: false

    pBackView: mChangingRoom


    NavigationRect {
        id: iMilanPadlock
        pXYWH: [422, 576, 50 ,50]

        pEnabled: !pMilanOpen
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
        id: iCandeePadlock
        pXYWH: [725, 576, 50 ,50]

        pEnabled: !pCandeeOpen
        pSource: "Padlock.png"
        functionOnClicked: function() {pCandeeOpen = true }
    }
    NavigationRect {
        id: iAmyPadlock
        pXYWH: [1035, 576, 50 ,50]

        pEnabled: !pAmyOpen
        pSource: "Padlock.png"
        functionOnClicked: function() {pAmyOpen = true }
    }
    NavigationRect {
        id: iAngelPadlock
        pXYWH: [1343, 578, 50 ,50]

        pEnabled: !pAngelOpen
        pSource: "Padlock.png"
        functionOnClicked: function() { mAngelGame.startFadeIn()}
    }

    NavigationRect {
        id: iMilanLocker
        pXYWH: [420, 520, 55, 100]

        pEnabled: pMilanOpen
        functionOnClicked: function() {mLockerMilan.startFadeIn() }
    }
    NavigationRect {
        id: iCandeeLocker
        pXYWH: [722, 518, 55, 100]

        pEnabled: pCandeeOpen
        functionOnClicked: function() {pCandeeOpen = true }
    }
    NavigationRect {
        id: iAmyLocker
        pXYWH: [1032, 520, 55, 100]

        pEnabled: pAmyOpen
        functionOnClicked: function() {pAmyOpen = true }
    }
    NavigationRect {
        pXYWH: [1338, 520, 55, 100]

        id: iAngelLocker
        pEnabled: pAngelOpen
        functionOnClicked: function() {mLockerAngel.startFadeIn() }
    }

    LockerMilan {
        id: mLockerMilan
    }
    BasicVideo {
        id: iMilanVideo2
        objectName: "Milan: Locker"
        pAvailable: true
        pSource: "../../../assets/testVideo/C08_Mysterious Closet - Alex-Milan.mp4"
    }
    LockerAngel {
        id: mLockerAngel
    }

    PadlockGame {
        id: mMilanGame

        pCorrect: [0, 0, 0, 0, 0]
        pListListletters: [
            ["A", "B", "C", "D", "E", "F", "G", "H"],
            ["A", "B", "C", "D", "E", "F", "G", "H"],
            ["A", "B", "C", "D", "E", "F", "G", "H"],
            ["A", "B", "C", "D", "E", "F", "G", "H"],
            ["A", "B", "C", "D", "E", "F", "G", "K"],
        ]
        pFunctionToDo: function() {
            pMilanOpen = true
            mConstants.closetMilanOpened = true;
        }
    }
    PadlockGame {
        id: mAngelGame

        pCorrect: [0, 0, 0, 0, 0]
        pListListletters: [
            ["A", "B", "C", "D", "E", "F", "G", "H"],
            ["1", "2", "3", "4", "5", "6", "7", "8"],
            ["1", "2", "3", "4", "5", "6", "7", "8"],
            ["1", "2", "3", "4", "5", "6", "7", "8"],
            ["1", "2", "3", "4", "5", "6", "7", "8"],
        ]
        pFunctionToDo: function() {
            pAngelOpen = true;
            mConstants.closetAngelOpened = true;
            mMainManager.updateAll()
        }
    }



}


