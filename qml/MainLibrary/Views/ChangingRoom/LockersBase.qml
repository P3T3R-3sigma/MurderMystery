import QtQuick
import Felgo

import "../"


FourDirectionView {
    id: iBaseLockers

    pListDirections: [mNorth, mEast, mSouth, mWest]

    LockersEast {
        id: mEast
        pCode: "ROOM" + pBaseCode + "E"
    }
    LockersNorth {
        id: mNorth
        pCode: "ROOM" + pBaseCode + "N"
    }
    LockersWest {
        id: mWest
        pCode: "ROOM" + pBaseCode + "W"
    }
    LockersSouth {
        id: mSouth
        pCode: "ROOM" + pBaseCode + "S"
    }
}




