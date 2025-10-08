import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

BaseView {
    id: iFreezer

    pImageSource: "FreezerBothClosed.png"
    pBackView: iBigStorageRoom

    property bool pFreezerOpen: false
    property bool pFridgeOpen: false
    property bool pMagnetTaken: false
    property bool pIceMelted: false

    NavigationRect {
        id: closeFridge
        xPercent: 0.23
        yPercent: 0.22
        widthPercent: 0.06
        heightPercent: 0.4
        pEnabled: pFridgeOpen
        functionOnClicked: function() {pFridgeOpen = false; calculateImage()}
    }
    NavigationRect {
        id: closeFreezer
        xPercent: 0.23
        yPercent: 0.67
        widthPercent: 0.06
        heightPercent: 0.32
        pEnabled: pFreezerOpen
        functionOnClicked: function() {pFreezerOpen = false; calculateImage()}
    }
    NavigationRect {
        id: openFridge
        xPercent: 0.565
        yPercent: 0.4
        widthPercent: 0.03
        heightPercent: 0.18
        pEnabled: !pFridgeOpen
        functionOnClicked: function() {pFridgeOpen = true; calculateImage()}
    }
    NavigationRect {
        id: openFreezer
        xPercent: 0.565
        yPercent: 0.63
        widthPercent: 0.03
        heightPercent: 0.18
        pEnabled: !pFreezerOpen
        functionOnClicked: function() {pFreezerOpen = true; calculateImage()}
    }
    Magnet {
        id: mMagnet
        xPercent: 0.35
        yPercent: 0.285
        widthPercent: 0.02
        heightPercent: 0.05
        visible: !pPickedUp && !pFridgeOpen
    }
    NavigationRect {
        id: meltIce
        xPercent: 0.29
        yPercent: 0.83
        widthPercent: 0.09
        heightPercent: 0.15
        pEnabled: pFreezerOpen && !pIceMelted && mConstants.hairDryerPickedUp && mConstants.extensionCablePickedUp
        functionOnClicked: function() {pIceMelted = true; calculateImage()}
    }
    KeyBlue {
        id: takeKey
        xPercent: 0.32
        yPercent: 0.9
        widthPercent: 0.03
        heightPercent: 0.055
        visible: pFreezerOpen && !pPickedUp
        pEnabled: pIceMelted
    }

    function calculateImage() {
        if (pFreezerOpen && pFridgeOpen && !pIceMelted) {
            pImageSource = "FreezerBothOpen.png"
        }
        else if (!pFreezerOpen && !pFridgeOpen) {
            pImageSource = "FreezerBothClosed.png"
        }
        else if (!pFreezerOpen && pFridgeOpen) {
            pImageSource = "FreezerFridgeOpen.png"
        }
        else if (pFreezerOpen && !pFridgeOpen && !pIceMelted) {
            pImageSource = "FreezerFreezerOpen.png"
        }
        else if (pFreezerOpen && pFridgeOpen && pIceMelted) {
            pImageSource = "FreezerBothOpenNoKey.png"
        }
        else if (pFreezerOpen && !pFridgeOpen && pIceMelted) {
            pImageSource = "FreezerOpenNoKey.png"
        }
        else {
            console.log("ERROR:" + this)
        }
    }
}
