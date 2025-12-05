import QtQuick
import Felgo

import "../"


FourDirectionView {
    id: iBaseMakeUp

    pListDirections: [mNorth, mEast, mSouth, mWest]

    MakeUpEast {
        id: mEast
        pCode: "ROOM" + pBaseCode + "E"
    }
    MakeUpNorth {
        id: mNorth
        pCode: "ROOM" + pBaseCode + "N"
    }
    MakeUpWest {
        id: mWest
        pCode: "ROOM" + pBaseCode + "W"
    }
    MakeUpSouth {
        id: mSouth
        pCode: "ROOM" + pBaseCode + "S"
    }
}




