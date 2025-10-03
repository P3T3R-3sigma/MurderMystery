import QtQuick 2.0

import "../Videos"

Item {
    id: iItemManager

    property var pItems: []

    function addItem(item) {
        pItems.push(item)
    }

    function listContent() {
        for (let i in pItems) {
            console.log(pItems[i])
        }
    }

    function updateContent() {
        for (let i in pItems) {
            pItems[i].updateItem()
        }
    }

    Component.onCompleted: mMainManager.addManager(iItemManager)
}

