import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

BaseView {
    id: iComputerView

    property bool p20Used: false
    property bool p21Used: false
    property bool p22Used: false
    property bool p23Used: false
    property bool p24Used: false

    NavigationRect {
        id: openComputer
        pXYWH: [350, 700, 1100, 200]

        functionOnClicked: function() {
            mComputer.startFadeIn()
        }
    }
    EnvironmentItem {
        id: environmentSmallCD
        pUse: mConstants.mUseEnum.CD_PLAYER_SMALL
        pNeeded: !(p23Used && p24Used)
    }
    EnvironmentItem {
        id: environmentBigCD
        pUse: mConstants.mUseEnum.CD_PLAYER_BIG
        pNeeded: !(p20Used && p21Used && p22Used)
    }

    Computer {
        id: mComputer
        pBackView: iComputerView
        pCode: "ROOM" + pBaseCode + "V"
    }


    BaseItem {
        id: milanDiary

        pXYWH: [1500, 550, 50, 50]

        pName: "Raul + Amy"
        pUse: mConstants.mUseEnum.RAUL_AMY

        x: 1100
        y: 900
        width: 100
        height: 100
    }


    function shadowUseItem(item) {
        if (item.pUse === mConstants.mUseEnum.VIDEO_OF_MURDER) {
            mInventory.removeItem(mConstants.mUseEnum.VIDEO_OF_MURDER)
            p20Used = true
            console.log("RETIREMENT_PLAN inserted.")
        } else if (item.pUse === mConstants.mUseEnum.RETIREMENT_PLAN) {
            mInventory.removeItem(mConstants.mUseEnum.RETIREMENT_PLAN)
            p21Used = true
            console.log("RETIREMENT_PLAN inserted.")
        } else if (item.pUse === mConstants.mUseEnum.RAUL_AMY) {
            mInventory.removeItem(mConstants.mUseEnum.RAUL_AMY)
            p22Used = true
            console.log("RETIREMENT_PLAN inserted.")
        } else if (item.pUse === mConstants.mUseEnum.CANDEE_AMY) {
            mInventory.removeItem(mConstants.mUseEnum.CANDEE_AMY)
            p23Used = true
            console.log("RETIREMENT_PLAN inserted.")
        } else if (item.pUse === mConstants.mUseEnum.MILAN_BLACKMAIL) {
            mInventory.removeItem(mConstants.mUseEnum.MILAN_BLACKMAIL)
            p24Used = true
            console.log("RETIREMENT_PLAN inserted.")
        } else {
            return false
        }
        return true
    }
}
