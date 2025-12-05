import QtQuick
import Felgo

import "../Controll"
import "../../BaseLibrary"

Item {
    id: baseView

    property string pImageSource: ""
    property int pUse: mConstants.mUseEnum.NOTHING
    property var pBackView: null
    property bool pEnabled: baseView === scene.mCurrentScene
    property string pCode: ""

    visible: false
    anchors.fill: parent
    opacity: 1

    BaseImage {
        id: iImage
        width: 1920
        height: 1080
        pAssetCode: pCode
    }

    AppImage {
        anchors.fill: parent

        source: pImageSource ? "../../../assets/Images/" + pImageSource : ""
    }

    NavigationRect {
        id: goBack
        pXYWH: [1720, 0, 200, 100]

        pEnabled: baseView.pEnabled && pBackView !== null
        functionOnClicked: function() {
            startFadeOut(pBackView)
        }
    }

    function changeImage(lCode) {
        iImage.setSource(lCode)
    }

    function startFadeOut(lNext) {
        baseView.visible = false
        if (lNext) {
            lNext.startFadeIn()
        }
    }

    function startFadeIn() {
        scene.mCurrentScene = baseView
        baseView.visible = true
    }

    function useItem(item) {
        if (item.pUse === mConstants.mUseEnum.MAGNET && mConstants.stringPickedUp && mConstants.candeeDropedTheKey) {
            mInventory.removeItem(mConstants.mUseEnum.MAGNET)
            mInventory.removeItem(mConstants.mUseEnum.STRING)
            mMagnetHook.pickUp()
            return true
        }
        if (item.pUse === mConstants.mUseEnum.STRING && mConstants.magnetPickedUp && mConstants.candeeDropedTheKey) {
            mInventory.removeItem(mConstants.mUseEnum.MAGNET)
            mInventory.removeItem(mConstants.mUseEnum.STRING)
            mMagnetHook.pickUp()
            return true
        }
        console.log("HERE 1: ", item)
        return shadowUseItem(item)
    }

    function shadowUseItem(item) {
        return false
    }
}


