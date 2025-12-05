import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

BaseView {
    id: iStorageEast

    BaseItem {
        id: sideSafeGear

        pXYWH: [1400, 550, 50, 50]
        x: 800
        y: 650
        width: 100
        height: 100
        pName: "Side Safe Gear"
        pUse: mConstants.mUseEnum.GEAR

        function onPickUp() {
            mConstants.safeGearPickedUp = true
        }
    }


}


