import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

BaseView {
    id: iMainSafe

    pImageSource: "MainSafe.png"
    pBackView: mDeskOfHeart

    MurderVideo {
        id: mMurderVideo
        xPercent: 0.5
        yPercent: 0.7
        widthPercent: 0.08
        heightPercent: 0.08
    }




}


