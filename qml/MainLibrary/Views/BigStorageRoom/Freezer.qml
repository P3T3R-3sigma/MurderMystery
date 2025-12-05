import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

BaseView {
    id: iFreezer

    property bool pFreezerOpen: false
    property bool pFridgeOpen: false
    property bool pMagnetTaken: false
    property bool pIceMelted: false

    NavigationRect {
        id: closeFridge
        pXYWH: [435, 200, 122, 480]

        pEnabled: pFridgeOpen
        functionOnClicked: function() {pFridgeOpen = false; calculateImage()}
    }
    NavigationRect {
        id: closeFreezer
        pXYWH: [435, 760, 122, 300]

        pEnabled: pFreezerOpen
        functionOnClicked: function() {pFreezerOpen = false; calculateImage()}
    }
    NavigationRect {
        id: openFridge
        pXYWH: [1088, 435, 60, 180]

        pEnabled: !pFridgeOpen
        functionOnClicked: function() {pFridgeOpen = true; calculateImage()}
    }
    NavigationRect {
        id: openFreezer
        pXYWH: [1088, 680, 60, 175]

        pEnabled: !pFreezerOpen
        functionOnClicked: function() {pFreezerOpen = true; calculateImage()}
    }
    BaseItem {
        id: iMagnet

        pXYWH: [1800, 550, 50, 50]
        pName: "Magnet"
        pUse: mConstants.mUseEnum.MAGNET
        visible: !pPickedUp && !pFridgeOpen

        x: 600
        y: 400
        width: 60
        height: 75

        function onPickUp() {
            mConstants.magnetPickedUp = true
        }
    }
    NavigationRect {
        id: meltIce
        pXYWH: [562, 900, 165, 155]

        pEnabled: pFreezerOpen && !pIceMelted
        functionOnClicked: function() {console.log("Need to melt the ice.")}
    }
    BaseItem {
        id: blueKey

        pXYWH: [1600, 750, 50, 50]
        pName: "Key Blue"
        pUse: mConstants.mUseEnum.BLUE_KEY
        visible: pFreezerOpen && !pPickedUp
        pEnabled: pIceMelted

        x: 620
        y: 950
        width: 50
        height: 50

        function onPickUp() {
            mConstants.blueKeyPickedUp = true
        }
    }
    EnvironmentItem {
        id: environment
        pUse: 30
    }

    function calculateImage() {
        if (pFreezerOpen && pFridgeOpen && !pIceMelted) {
            changeImage("State11")
        }
        else if (!pFreezerOpen && !pFridgeOpen) {
            changeImage("State00")
        }
        else if (!pFreezerOpen && pFridgeOpen) {
            changeImage("State10")
        }
        else if (pFreezerOpen && !pFridgeOpen && !pIceMelted) {
            changeImage("State01")
        }
        else if (pFreezerOpen && pFridgeOpen && pIceMelted) {
            changeImage("State12")
        }
        else if (pFreezerOpen && !pFridgeOpen && pIceMelted) {
            changeImage("State02")
        }
        else {
            console.log("ERROR:" + this)
        }
    }

    function shadowUseItem(item) {
        if (item.pUse === mConstants.mUseEnum.HAIR_DRYER && pFreezerOpen) {
            if (mConstants.extensionCablePickedUp) {
                mInventory.removeItem(mConstants.mUseEnum.HAIR_DRYER)
                mInventory.removeItem(mConstants.mUseEnum.EXTENSION_CABLE)
                pIceMelted = true
                calculateImage()
                console.log("Ice melted.")
            } else {
                console.log("Can't reach an outlet. Need an extention.")
            }
            return true
        }
        return false
    }


}
