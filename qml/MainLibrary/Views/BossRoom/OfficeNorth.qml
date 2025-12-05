import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

BaseView {
    id: iOfficeNorth

    NavigationRect {
        pXYWH: [1500, 400, 225, 500]

        functionOnClicked: function() { iBaseOffice.changeRoom(mStorage) }
    }

    BaseItem {
        id: iString

        pXYWH: [1700, 550, 50, 50]
        pName: "String"
        pUse: mConstants.mUseEnum.STRING

        x: 1100
        y: 650
        width: 100
        height: 100

        function onPickUp() {
            mConstants.stringPickedUp = true
        }
    }
}


