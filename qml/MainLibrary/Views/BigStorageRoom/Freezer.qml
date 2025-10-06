import QtQuick
import Felgo

import "../"
import "../../Controll"

BaseView {
    id: iFreezer

    pImageSource: "FreezerBothClosed.png"
    pNextView: iBigStorageRoom

    property bool pFreezerOpen: false
    property bool pFridgeOpen: false
    property bool pMagnetTaken: false
    property bool pKeyTaken: false

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
    NavigationRect {
        id: takeMagnet
        xPercent: 0.35
        yPercent: 0.285
        widthPercent: 0.02
        heightPercent: 0.05
        pEnabled: !pFridgeOpen && !pMagnetTaken
        functionOnClicked: function() {pMagnetTaken = true; calculateImage()}
    }
    NavigationRect {
        id: takeKey
        xPercent: 0.29
        yPercent: 0.82
        widthPercent: 0.1
        heightPercent: 0.15
        pEnabled: pFreezerOpen && !pKeyTaken
        functionOnClicked: function() {pKeyTaken = true; calculateImage()}
    }
    Rectangle {
        id: iMagnetMask
        visible: !pFridgeOpen && pMagnetTaken

        x:  parent.width * 0.35
        y:  parent.height * 0.285
        width: parent.width * 0.02
        height: parent.height * 0.05
    }

    function calculateImage() {
        if (pFreezerOpen && pFridgeOpen && !pKeyTaken) {
            pImageSource = "FreezerBothOpen.png"
        }
        else if (!pFreezerOpen && !pFridgeOpen) {
            pImageSource = "FreezerBothClosed.png"
        }
        else if (!pFreezerOpen && pFridgeOpen) {
            pImageSource = "FreezerFridgeOpen.png"
        }
        else if (pFreezerOpen && !pFridgeOpen && !pKeyTaken) {
            pImageSource = "FreezerFreezerOpen.png"
        }
        else if (pFreezerOpen && pFridgeOpen && pKeyTaken) {
            pImageSource = "FreezerBothOpenNoKey.png"
        }
        else if (pFreezerOpen && !pFridgeOpen && pKeyTaken) {
            pImageSource = "FreezerOpenNoKey.png"
        }
        else {
            console.log("ERROR:" + this)
        }
    }
}
