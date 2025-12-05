import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

BaseView {
    id: iMainSafe

    pImageSource: "MainSafe.png"

    BaseItem {
        id: iMurderVideo

        pXYWH: [1600, 850, 50, 50]

        pName: "Video of Murder"
        pUse: mConstants.mUseEnum.VIDEO_OF_MURDER

        x: 1000
        y: 800
        width: 100
        height: 100


        function onPickUp() {
            mConstants.murderVideoPickedUp = true
        }
    }



}


