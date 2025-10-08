import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

BaseView {
    id: iMakeUpDesk

    pImageSource: "MakeUpDesk.png"
    pBackView: mMakeUpRoom

    HairDryer {
        xPercent: 0.4
        yPercent: 0.57
        widthPercent: 0.15*1080/1920
        heightPercent: 0.15
    }
}


