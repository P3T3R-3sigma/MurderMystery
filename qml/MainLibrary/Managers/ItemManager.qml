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

            MouseArea {
                anchors.fill: parent
                onClicked: pItems[index].pickUp()
            }
        }
    }

    function addItem(item) {
        pItems.push(item)
        pItems = pItems
    }
    function getItem(lName) {
        for (let i in pItems) {
            if (pItems[i].pName === lName) {
                return pItems[i]
            }
        }
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

        pItems = pItems
    }

    Component.onCompleted: mMainManager.addManager(iItemManager)
}

