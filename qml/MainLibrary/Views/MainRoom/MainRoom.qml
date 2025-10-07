import QtQuick
import Felgo

import "../../Controll"
import "../"

BaseView {
    id: iMainRoom
    objectName: "Main Room"
    pImageSource: "MainRoom.png"

    NavigationRect {
        xPercent: 0.77
        yPercent: 0.28
        widthPercent: 0.1
        heightPercent: 0.5
        functionOnClicked: function() { }
    }


    Component.onCompleted: mPlaceManager.addPlace(this)

}

