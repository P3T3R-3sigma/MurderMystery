import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

FourDirectionView {
    id: iBaseOffice

    pListDirections: [mNorth, mEast, mSouth, mWest]

    OfficeEast {
        id: mEast
        pCode: "ROOM" + pBaseCode + "E"
    }
    OfficeNorth {
        id: mNorth
        pCode: "ROOM" + pBaseCode + "N"
    }
    OfficeWest {
        id: mWest
        pCode: "ROOM" + pBaseCode + "W"
    }
    OfficeSouth {
        id: mSouth
        pCode: "ROOM" + pBaseCode + "S"
    }
}


