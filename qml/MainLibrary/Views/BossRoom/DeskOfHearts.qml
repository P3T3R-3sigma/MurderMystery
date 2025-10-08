import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

BaseView {
    id: iDeskOfHeart

    pImageSource: "DeskOfHeart.png"
    pBackView: mBossRoom

    property bool pRightOpen: false
    property bool pLeftOpen: false
    property bool pSafeOpen: false

    NavigationRect {
        id: closeLeft
        xPercent: 0.14
        yPercent: 0.63
        widthPercent: 0.05
        heightPercent: 0.3
        pEnabled: pLeftOpen
        functionOnClicked: function() {pLeftOpen = false; calculateImage()}
    }
    NavigationRect {
        id: closeRight
        xPercent: 0.87
        yPercent: 0.63
        widthPercent: 0.08
        heightPercent: 0.3
        pEnabled: pRightOpen
        functionOnClicked: function() {pRightOpen = false; calculateImage()}
    }
    NavigationRect {
        id: openLeft
        xPercent: 0.19
        yPercent: 0.58
        widthPercent: 0.13
        heightPercent: 0.3
        pEnabled: !pLeftOpen
        functionOnClicked: function() {pLeftOpen = true; calculateImage()}
    }
    NavigationRect {
        id: openRight
        xPercent: 0.76
        yPercent: 0.58
        widthPercent: 0.11
        heightPercent: 0.3
        pEnabled: !pRightOpen
        functionOnClicked: function() {pRightOpen = true; calculateImage()}
    }
    NavigationRect {
        id: searchSafe
        xPercent: 0.77
        yPercent: 0.69
        widthPercent: 0.093
        heightPercent: 0.18
        pEnabled: pRightOpen && pSafeOpen
        functionOnClicked: function() { mMainSafe.startFadeIn() }
    }
    NavigationRect {
        id: openSafe
        xPercent: 0.77
        yPercent: 0.69
        widthPercent: 0.095
        heightPercent: 0.18
        pEnabled: pRightOpen && !pSafeOpen && mConstants.redKeyPickedUp && mConstants.greenKeyPickedUp && mConstants.blueKeyPickedUp
        functionOnClicked: function() {pSafeOpen = true; calculateImage()}
    }
    NavigationRect {
        id: useComputer
        xPercent: 0.387
        yPercent: 0.172
        widthPercent: 0.3
        heightPercent: 0.19
        pEnabled: true
        functionOnClicked: function() {mComputer.startFadeIn()}
    }

    MainSafe {
        id: mMainSafe
    }
    Computer {
        id: mComputer
    }

    function calculateImage() {
        if (pRightOpen && pLeftOpen && !pSafeOpen) {
            pImageSource = "DeskOfHeartBothOpenSafeClosed.png"
        }
        if (pRightOpen && pLeftOpen && pSafeOpen) {
            pImageSource = "DeskOfHeartBothOpenSafeOpen.png"
        }
        else if (!pRightOpen && !pLeftOpen) {
            pImageSource = "DeskOfHeart.png"
        }
        else if (!pRightOpen && pLeftOpen) {
            pImageSource = "DeskOfHeartLeftOpen.png"
        }
        else if (pRightOpen && !pLeftOpen && !pSafeOpen) {
            pImageSource = "DeskOfHeartRightOpenSafeClosed.png"
        }
        else if (pRightOpen && !pLeftOpen && pSafeOpen) {
            pImageSource = "DeskOfHeartRightOpenSafeOpen.png"
        }
        else {
            console.log("ERROR:" + this)
        }
    }
}
