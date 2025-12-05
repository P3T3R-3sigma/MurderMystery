import QtQuick
import Felgo

import "../"
import "../../Controll"

BaseView {
    id: iMakeUpSouth


    NavigationRect {
        pXYWH: [1030, 320, 190, 450]

        functionOnClicked: function() { iBaseMakeUp.changeRoom(mLockers) }
    }
}


