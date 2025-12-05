import QtQuick
import Felgo

import "../"
import "../../Controll"

BaseView {
    id: iStorageSouth

    NavigationRect {
        pXYWH: [500, 500, 150, 300]

        functionOnClicked: function() { iBaseStorage.changeRoom(mMainRoom) }
    }
    NavigationRect {
        pXYWH: [1057, 500, 160, 300]

        functionOnClicked: function() { iBaseStorage.changeRoom(mOffice) }
    }
}


