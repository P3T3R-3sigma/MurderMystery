import QtQuick

BaseItem {
    id: environmentItem

    pXYWH: [0,0,0,0]

    width: 0
    height: 0
    onVisibleChanged: {
        if (visible) {
            mInventory.addToInventory(environmentItem)
        } else {
            mInventory.removeItem(pUse)
        }
    }
}
