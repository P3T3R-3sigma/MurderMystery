import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

BaseView {
    id: iSideSafe

    pImageSource: "SafeOnTheWall.png"
    pBackView: mPictureOnWall

    KeyRed {
        xPercent: 0.5
        yPercent: 0.3
        widthPercent: 0.05
        heightPercent: 0.05
    }
    BlackMailVideo {
        xPercent: 0.4
        yPercent: 0.3
        widthPercent: 0.05
        heightPercent: 0.05

    }




}


