import QtQuick 2.0

BaseItem {
    id: iMagnet

    pXYWH: [1800, 550, 50, 50]
    pName: "Magnet"
    pSource: "Magnet.png"
    pUse: mConstants.mUseEnum.MAGNET

    function onPickUp() {
        mConstants.magnetPickedUp = true
    }
}
