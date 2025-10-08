import QtQuick 2.0

import "../Videos"

Item {
    id: iItemManager
    anchors.fill: parent

    property var pItems: []

    visible: true

    Repeater {
        id: irepeater
        model: pItems.length

        Rectangle {
            x: pItems[index].pXYWH[0]
            y: pItems[index].pXYWH[1]
            width: pItems[index].pXYWH[2]
            height: pItems[index].pXYWH[3]
            color: pItems[index].pColor

            Text {
                anchors.fill: parent
                text: pItems[index].pName
                wrapMode: Text.WordWrap
            }
        }
    }

    function addItem(item) {
        pItems.push(item)
        pItems = pItems
    }

    function listContent() {
        for (let i in pItems) {
            console.log(pItems[i], pItems[i].pColor)
        }
    }

    function updateContent() {
        for (let i in pItems) {
            pItems[i].updateItem()
        }
        if (mConstants.stringPickedUp && mConstants.magnetPickedUp) {
            mMagnetHook.pickUp()
        }

        pItems = pItems
    }

    Component.onCompleted: mMainManager.addManager(iItemManager)
}

