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
        pXYWH: [0, 200, 600, 800]

        functionOnClicked: function() {mLocker.startFadeIn()}
    }

    Lockers {
        id: mLocker
    }

    Component.onCompleted: mPlaceManager.addPlace(this)

}
