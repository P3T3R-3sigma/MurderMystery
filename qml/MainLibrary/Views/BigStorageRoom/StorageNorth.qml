import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

BaseView {
    id: iStorageNorth

    BaseItem {
        id: extensionCable

        pXYWH: [1600, 550, 50, 50]
        x: 800
        y: 650
        width: 100
        height: 100
        pName: "Extension Cable"
        pUse: mConstants.mUseEnum.EXTENSION_CABLE


        function onPickUp() {
            mConstants.extensionCablePickedUp = true
        }
    }

}


