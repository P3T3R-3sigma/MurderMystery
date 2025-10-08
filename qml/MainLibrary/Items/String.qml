import QtQuick 2.0

BaseItem {
    id: iString

    pXYWH: [1700, 550, 50, 50]
    pName: "String"
    pSource: "String.png"

    function onPickUp() {
        mConstants.stringPickedUp = true
    }
}
