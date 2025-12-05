import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

BaseView {
    id: iSideSafe

    pImageSource: "SafeOnTheWall.png"


    BaseItem {
        id: iBlackMailVideo

        pXYWH: [1400, 650, 50, 50]

        pName: "Retirement plan"
        pUse: mConstants.mUseEnum.RETIREMENT_PLAN

        x: 1050
        y: 600
        width: 100
        height: 100

        function onPickUp() {
            mConstants.blackMailVideoPickedUp = true
        }
    }






}


