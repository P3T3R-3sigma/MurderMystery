import QtQuick
import Felgo

import "../../Controll"
import "../../Characters"
import "../../Items"
import "../..//Puzzle/MagnetGame"
import "../"

BaseView {
    id: iMainRoomSideView
    objectName: "Main Room SideView"
    pImageSource: "MainRoomSideView.png"
    pBackView: mMainRoom

    NavigationRect {
        pXYWH: [90, 70, 360, 595]

        functionOnClicked: function() {startFadeOut(mVIP_Alcove) }
    }
    NavigationRect {
        pXYWH: [1530, 110, 235, 550]

        functionOnClicked: function() {startFadeOut(mMakeUpRoom) }
    }

    NavigationRect {
        pXYWH: [588, 680, 117, 122]

        visible: mConstants.candeeDropedTheKey && !mConstants.greenKeyPickedUp
        functionOnClicked: function() { iPopUp.visible = true }
    }

    PopUpField {
        id: iPopUp
        pText: "Can't reach!"
        z: 10
    }

    Candee { id: mCandee }

    KeyGreen {
        id: mKeyGreen
        visible: false
    }

    MagnetGame { id: mMagnetGame }


    function shadowUseItem(item) {
        if (item.pUse === mConstants.mUseEnum.MAGNETHOOK &&  mConstants.candeeDropedTheKey) {
            mInventory.removeItem(mConstants.mUseEnum.MAGNETHOOK)
            mInventory.close()
            mMagnetGame.startFadeIn()
            return true
        }
        return false
    }

    Component.onCompleted: mPlaceManager.addPlace(this)

}

