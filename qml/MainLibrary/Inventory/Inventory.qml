import QtQuick
import Felgo

import "../../BaseLibrary"

Item {
    id: iInventory
    anchors.fill: parent

    property var pInventory: []

    Rectangle {
        id: iClosedInventory
        x: 1600
        y: 900
        width: 200
        height: 100
        color: "#824F28"

        z: 10
        visible: true

        Text {
            anchors.centerIn: parent
            text: "Inventory"
            font.pixelSize: 40
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                mInspect.visible = false
                iOpenInventory.visible = !iOpenInventory.visible
                scene.mEnabled = !scene.mEnabled
            }
        }
    }
    Rectangle {
        id: iOpenInventory
        anchors.centerIn: parent
        width: 1125
        height: 800
        color: "#824F28"

        visible: false

        Flow {
            x: 50
            y: 50
            width: parent.width
            height: parent.height
            spacing: 25
            Repeater {
                model: 18

                Rectangle {
                    width: 150
                    height: width
                    color: "#613413"
                    BaseImage {
                        anchors.fill: parent
                        pAssetCode: pInventory.length > index ? pInventory[index].pCode : ""
                    }
                    MouseArea {
                        anchors.fill: parent
                        enabled: !mInspect.visible
                        onClicked: {
                            if (pInventory.length > index) {
                                mInspect.pIndex = index
                                mInspect.visible = true
                            }
                        }
                    }
                }
            }
        }
        Matcher {
            id: mMatcher
            y: 625
        }
    }

    function addToInventory(item) {
        pInventory.push(item)
        pInventory = pInventory
    }

    function removeItem(item) {
        for (let i in pInventory) {
            if (pInventory[i].pUse === item) {
                pInventory.splice(i, 1)
                pInventory = pInventory
                return
            }
        }
    }

    function listContent() {
        for (let i in pInventory) {
            console.log(pInventory[i], pInventory[i].pCode)
        }
    }

    function close() {
        iOpenInventory.visible = false
    }

    Inspect { id: mInspect }
}
