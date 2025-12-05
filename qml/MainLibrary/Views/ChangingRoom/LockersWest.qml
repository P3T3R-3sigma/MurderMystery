import QtQuick
import Felgo

import "../"
import "../../Controll"

BaseView {
    id: iLockersWest

    pImageSource: "LockersWest.png"


    NavigationRect {
        pXYWH: [790, 115, 245, 600]

        functionOnClicked: function() { iBaseLockers.changeRoom(mMainRoom) }
    }


}


