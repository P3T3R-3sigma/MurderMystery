import QtQuick
import Felgo

import "../../BaseLibrary"

Item {
    id: iMatcherSlot

    property var pMatchItem: null


    width: 100
    height: 100
    Rectangle {
        id: iRect
        anchors.fill: parent
        color: "#613413"
        BaseImage {
            anchors.fill: parent
            pAssetCode: pMatchItem ? pMatchItem.pCode : ""
        }
        MouseArea {
            anchors.fill: parent
            onClicked: removeItem()
        }
    }

    function removeItem() {
        pMatchItem = null
    }

    function rotate() {
        if (iRect.rotation === 270) {
            iRect.rotation = 0
        } else {
            iRect.rotation += 90
        }
    }
}
