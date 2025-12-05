import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

BaseView {
    id: iMilanLocker

    BaseItem {
        id: milanDiary

        pXYWH: [1500, 550, 50, 50]

        pName: "Milan BlackMail"
        pUse: mConstants.mUseEnum.MILAN_BLACKMAIL

        x: 1100
        y: 650
        width: 100
        height: 100
        function onPickUp() {
            mConstants.diaryMilanPickedUp = true
        }
    }
}


