import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

BaseView {
    id: iSideSafePicture

    pImageSource: "PictureOnTheWallFront.png"
    pBackView: mBossRoom

    property bool pPictureOpen: false
    property bool pSafeOpen: false
    property bool pSideView: false

    NavigationRect {
        id: safeSideView
        xPercent: 0.63
        yPercent: 0.1
        widthPercent: 0.02
        heightPercent: 0.7
        pEnabled: !pPictureOpen && !pSideView
        functionOnClicked: function() { pSideView = true; calculateImage()}
    }
    NavigationRect {
        id: pushButton
        xPercent: 0.474
        yPercent: 0.584
        widthPercent: 0.01
        heightPercent: 0.02
        pEnabled: pSideView
        functionOnClicked: function() {pPictureOpen = true; pSideView = false; calculateImage()}
    }
    NavigationRect {
        id: openSafe
        xPercent: 0.39
        yPercent: 0.31
        widthPercent: 0.17
        heightPercent: 0.28
        pEnabled: !pSafeOpen && pPictureOpen
        functionOnClicked: function() {pSafeOpen = true; calculateImage()}
    }
    NavigationRect {
        id: searchSafe
        xPercent: 0.39
        yPercent: 0.31
        widthPercent: 0.17
        heightPercent: 0.28
        pEnabled: pSafeOpen
        functionOnClicked: function() { mSideSafe.startFadeIn() }
    }

    SideSafe {
        id: mSideSafe
    }

    function calculateImage() {
        if (pSafeOpen) {
            pImageSource = "SafeOnTheWallOpen.png"
        }
        else if (pPictureOpen && !pSafeOpen) {
            pImageSource = "PictureOnTheWallOpen.png"
        }
        else if (!pPictureOpen && pSideView) {
            pImageSource = "PictureOnTheWallSide.png"
        }
        else if (!pPictureOpen && !pSideView) {
            pImageSource = "PictureOnTheWall.png"
        }
        else {
            console.log("ERROR:" + this)
        }
    }
}
