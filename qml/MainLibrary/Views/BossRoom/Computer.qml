import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

BaseView {
    id: iComputer

    pImageSource: "ComputerHomeScreen.png"
    pBackView: mDeskOfHeart

    property bool pVideosOpen: false

    NavigationRect {
        id: openVideos
        xPercent: 0.237
        yPercent: 0.396
        widthPercent: 0.038
        heightPercent: 0.07
        pEnabled: !pVideosOpen && mConstants.gotVideosFromCosta
        functionOnClicked: function() { pVideosOpen = true; calculateImage() }
    }
    NavigationRect {
        id: closeVideos
        xPercent: 0.845
        yPercent: 0.12
        widthPercent: 0.035
        heightPercent: 0.06
        pEnabled: pVideosOpen
        functionOnClicked: function() { pVideosOpen = false; calculateImage() }
    }

    ComputerVideoView {
        id: mComputerVideoView

        visible: pVideosOpen
    }

    function calculateImage() {
        if (pVideosOpen) {
            pImageSource = "ComputerVideos.png"
        }else {
            pImageSource = "ComputerHomeScreen.png"
        }
    }
}
