import QtQuick
import Felgo

import "../"
import "../../Items"
import "../../Controll"
import "../../Puzzle/GearGame"

BaseView {
    id: iSideSafePicture

    property bool pPictureOpen: false
    property bool pGearAdded: false
    property bool pSafeOpen: false
    property bool pSideView: false

    NavigationRect {
        id: safeSideView
        pXYWH: [1222, 115, 20, 740]

        pAdditionalEnable: !pPictureOpen && !pSideView
        functionOnClicked: function() { pSideView = true; calculateImage()}
    }
    NavigationRect {
        id: pushButton
        pXYWH: [910, 630, 20, 25]

        pAdditionalEnable: pSideView
        functionOnClicked: function() {pPictureOpen = true; pSideView = false; calculateImage()}
    }
    NavigationRect {
        id: openSafe
        pXYWH: [751, 347, 320, 275]

        pAdditionalEnable: !pSafeOpen && pPictureOpen
        functionOnClicked: function() {
            if (pGearAdded) {
                mGearGame.startFadeIn()
            } else {
                console.log("Some gears are missing.")
            }
        }
    }
    NavigationRect {
        id: searchSafe
        pXYWH: [751, 347, 320, 275]

        pAdditionalEnable: pSafeOpen
        functionOnClicked: function() { mSideSafe.startFadeIn() }
    }

    EnvironmentItem {
        id: environmentSafe
        visible: pPictureOpen
        pUse: mConstants.mUseEnum.SIDE_SAFE
    }

    SideSafe {
        id: mSideSafe
        pBackView: iSideSafePicture
        pCode: "ROOM" + pBaseCode + "GS"
    }

    GearGame {
        id: mGearGame
        pBackView: iSideSafePicture
    }

    function calculateImage() {
        if (pSafeOpen) {
            changeImage("SafeOpen")
        }
        else if (pPictureOpen && !pSafeOpen) {
            changeImage("Open")
        }
        else if (!pPictureOpen && pSideView) {
            changeImage("Side")
        }
        else if (!pPictureOpen && !pSideView) {
            changeImage("Closed")
        }
        else {
            console.log("ERROR:" + this)
        }
    }

    function shadowUseItem(item) {
        if (item.pUse === mConstants.mUseEnum.GEAR && pPictureOpen) {
            mInventory.removeItem(mConstants.mUseEnum.GEAR)
            pGearAdded = true
            calculateImage()
            return true
        }
    }
}
