import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

BaseView {
    id: iAngelLocker

    pImageSource: "LockerAngel.png"
    pBackView: mLocker

    DiaryAngel {
        xPercent: 0.5
        yPercent: 0.6
        widthPercent: 0.1
        heightPercent: 0.1
    }
    SideSafeGear {
        xPercent: 0.7
        yPercent: 0.57
        widthPercent: 0.1
        heightPercent: 0.1
    }
}


