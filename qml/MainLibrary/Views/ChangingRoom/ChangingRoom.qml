import QtQuick
import Felgo

import "../../Controll"
import "../"

BaseView {
    id: iChangingRoom

    NavigationRect {
        xPercent: 0
        yPercent: 0.1
        widthPercent: 0.3
        heightPercent: 0.8
        functionOnClicked: function() {mLocker.startFadeIn()}
    }

    Lockers {
        id: mLocker
    }


}
