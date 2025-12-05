import QtQuick 2.0

BaseItem {
    id: blueKey

    pXYWH: [1600, 750, 50, 50]
    pName: "Key Blue"
    pSource: "BlueKey.png"
    pUse: mConstants.mUseEnum.BLUE_KEY

    function onPickUp() {
        mConstants.blueKeyPickedUp = true
    }
}
