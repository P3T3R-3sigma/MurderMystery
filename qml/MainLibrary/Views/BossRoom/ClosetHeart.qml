import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

BaseView {
    id: iDeskOfHeart

    pImageSource: "ClosetHeartClosed.png"
    pBackView: mBossRoom

    property bool pOpen: false

    NavigationRect {
        id: open
        xPercent: 0.335
        yPercent: 0.133
        widthPercent: 0.38
        heightPercent: 0.8
        pEnabled: !pOpen
        functionOnClicked: function() {pOpen = true; calculateImage()}
    }
    NavigationRect {
        id: close1
        xPercent: 0.225
        yPercent: 0.133
        widthPercent: 0.108
        heightPercent: 0.8
        pEnabled: pOpen
        functionOnClicked: function() {pOpen = false; calculateImage()}
    }
    NavigationRect {
        id: close2
        xPercent: 0.717
        yPercent: 0.133
        widthPercent: 0.125
        heightPercent: 0.8
        pEnabled: pOpen
        functionOnClicked: function() {pOpen = false; calculateImage()}
    }

    ExtensionCable {
        id: mExtensionCable
        xPercent: 0.62
        yPercent: 0.71
        widthPercent: 0.08
        heightPercent: 0.08
        pEnabled: pOpen
        visible: pOpen && !pPickedUp
    }

    function calculateImage() {
        if (pOpen) {
            pImageSource = "ClosetHeartOpen.png"
        } else {
            pImageSource = "ClosetHeartClosed.png"
        }
    }
}
