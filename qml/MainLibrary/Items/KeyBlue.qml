import QtQuick 2.0

BaseItem {
    id: blueKey

    pXYWH: [1600, 750, 50, 50]
    pName: "Key Blue"
    pSource: "BlueKey.png"

    function onPickUp() {
        mConstants.blueKeyPickedUp = true
    }
}
