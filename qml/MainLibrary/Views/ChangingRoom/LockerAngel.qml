import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

BaseView {
    id: iAngelLocker

    BaseItem {
        id: angelDiary

        pXYWH: [1500, 650, 50, 50]
        pName: "Diary Angel"
        pUse: mConstants.mUseEnum.ANGEL_DIARY

        x: 1100
        y: 650
        width: 100
        height: 100
        function onPickUp() {
            mConstants.diaryAngelPickedUp = true
        }
    }

}


