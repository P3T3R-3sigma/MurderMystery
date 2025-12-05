import QtQuick
import Felgo

import "../../BaseLibrary"

Rectangle {
    id: iInspect
    property int pIndex: -1

    x: (parent.width-width)/2
    y: (parent.height-height)/2
    width: parent.width * 0.8
    height: parent.height * 0.8
    color: "#824F28"

    visible: false

    Rectangle {
        x: parent.width * 0.1
        y: parent.height * 0.2
        width: parent.width * 0.3
        height: parent.height * 0.6
        color: "#613413"
        Rectangle {
            anchors.centerIn: parent
            width: parent.width * 0.4
            height: width
            color: "#613413"
            BaseImage {
                id: iInspectSource
                anchors.fill: parent
                pAssetCode: pIndex !== -1 ?  pInventory[pIndex].pCode : ""
            }
        }
    }
    Rectangle {
        x: parent.width * 0.5
        y: parent.height * 0.1
        width: parent.width * 0.4
        height: parent.height * 0.6
        color: "#613413"
        Rectangle {
            x: parent.width * 0.1
            y: parent.height * 0.4
            width: parent.width * 0.8
            height: parent.height * 0.5
            color: "#824F28"
            Text {
                id: iInspectDescription
                anchors.centerIn: parent
                text: pIndex !== -1 ? pInventory[pIndex].pDescription : ""
                font.pixelSize: 24
            }
        }
        Rectangle {
            x: parent.width * 0.1
            y: parent.height * 0.1
            width: parent.width * 0.8
            height: parent.height * 0.2
            color: "#824F28"
            Text {
                anchors.centerIn: parent
                text: "Description"
                font.pixelSize: 40
            }
        }
    }
    Rectangle {
        x: parent.width * 0.6
        y: parent.height * 0.8
        width: parent.width * 0.2
        height: parent.height * 0.1
        color: "#613413"
        Text {
            anchors.centerIn: parent
            text: qsTr("Add to Matcher")
            font.pixelSize: 40
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                useItem()
            }
        }
    }

    function useItem() {
        mMatcher.addItem(pInventory[pIndex])
        visible = false
        pIndex = -1
    }
}
