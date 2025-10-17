import QtQuick
import Felgo

import "../Interact"

Item {
    id: iInventory
    anchors.fill: parent

    property var pInventory: []

    function addToInventory(item) {
        pInventory.push(item)
        pInventory = pInventory
    }

    Rectangle {
        x: (parent.width-width)/2
        y: (parent.height-height)/2
        width: parent.width * 0.6
        height: parent.height * 0.6
        color: "#824F28"

        Flow {
            x: iInventory.width * 0.01
            y: iInventory.width * 0.01
            width: parent.width * 1
            height: parent.height * 1
            spacing: iInventory.width * 0.02
            Repeater {
                model: pInventory.length

                Rectangle {
                    width: iInventory.width * 0.1
                    height: width
                    color: "#613413"
                    AppImage {
                        anchors.fill: parent
                        source:  "../../../assets/Images/" + pInventory[index].pSource
                    }
                }
            }
        }
    }
}
