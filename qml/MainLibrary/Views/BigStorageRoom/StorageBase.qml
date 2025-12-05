import QtQuick
import Felgo

import "../"


FourDirectionView {
    id: iBaseStorage

    pListDirections: [mNorth, mEast, mSouth, mWest]

    StorageEast {
        id: mEast
        pCode: "ROOM" + pBaseCode + "E"
    }
    StorageNorth {
        id: mNorth
        pCode: "ROOM" + pBaseCode + "N"
    }
    StorageWest {
        id: mWest
        pCode: "ROOM" + pBaseCode + "W"
    }
    StorageSouth {
        id: mSouth
        pCode: "ROOM" + pBaseCode + "S"
    }
}




