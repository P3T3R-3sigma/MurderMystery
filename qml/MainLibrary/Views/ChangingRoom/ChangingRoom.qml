import QtQuick
import Felgo

import "../../Controll"
import "../"

BaseView {
    id: iChangingRoom
    objectName: "Changing Room"
    pImageSource: "ChangingRoom.png"
    pBackView: mMakeUpRoom

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

    Component.onCompleted: mPlaceManager.addPlace(this)

}
