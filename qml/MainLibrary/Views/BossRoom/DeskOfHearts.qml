import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"
import "../../Puzzle/CircleGame"

BaseView {
    id: iDeskOfHeart

    property bool pGreenUsed: false
    property bool pRedUsed: false
    property bool pBlueUsed: false
    property bool pSafeOpen: false

    NavigationRect {
        id: searchSafe
        pXYWH: [1370, 670, 170, 200]

        pEnabled: pSafeOpen
        functionOnClicked: function() { mMainSafe.startFadeIn() }
    }
    NavigationRect {
        id: openSafe
        pXYWH: [1370, 670, 170, 200]

        pEnabled: !pSafeOpen
        functionOnClicked: function() {
            if (pGreenUsed && pRedUsed && pBlueUsed) {
                mCircleGame.startFadeIn()
            } else {
                console.log("Something is missing")
            }
        }
    }
    EnvironmentItem {
        id: environmentSafe
        pUse: mConstants.mUseEnum.MAIN_SAFE
        pNeeded: !(pRedUsed && pBlueUsed && pGreenUsed)
    }

    MainSafe {
        id: mMainSafe
        pBackView: iDeskOfHeart
        pCode: "ROOM01MS"
    }

    CircleGame {
        id: mCircleGame
    }

    function calculateImage() {
        return
    }


    function shadowUseItem(item) {
        if (item.pUse === mConstants.mUseEnum.GREEN_KEY) {
            mInventory.removeItem(mConstants.mUseEnum.GREEN_KEY)
            pGreenUsed = true
            console.log("Green key used.")
        } else if (item.pUse === mConstants.mUseEnum.RED_KEY) {
            mInventory.removeItem(mConstants.mUseEnum.RED_KEY)
            pRedUsed = true
            console.log("Red key used.")
        } else if (item.pUse === mConstants.mUseEnum.BLUE_KEY) {
            mInventory.removeItem(mConstants.mUseEnum.BLUE_KEY)
            pBlueUsed = true
            console.log("Blue key used.")
        } else {
            return false
        }
        return true
    }
}
