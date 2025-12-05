import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

BaseView {
    id: iCandeeLocker


    BaseItem {
        id: iCandeeVideo

        pXYWH: [1500, 550, 50, 50]

        pName: "Amy + Candee"
        pUse: mConstants.mUseEnum.CANDEE_AMY

        x: 1100
        y: 650
        width: 100
        height: 100
    }

}


