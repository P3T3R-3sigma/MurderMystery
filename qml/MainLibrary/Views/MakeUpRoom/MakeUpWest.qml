import QtQuick
import Felgo

import "../"
import "../../Controll"

BaseView {
    id: iMakeUpWest


    NavigationRect {
        pXYWH: [780, 300, 260, 630]

        functionOnClicked: function() { iBaseMakeUp.changeRoom(mStorage) }
    }

}


