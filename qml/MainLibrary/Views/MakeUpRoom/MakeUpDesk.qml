import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

BaseView {
    id: iMakeUpDesk


    BaseItem {
        id: iHairDryer

        pXYWH: [1600, 650, 50, 50]
        pName: "Hair Dryer"
        x: 800
        y: 650
        width: 100
        height: 100
        pUse: mConstants.mUseEnum.HAIR_DRYER

        function onPickUp() {
            mConstants.hairDryerPickedUp = true
        }
    }

}


