import QtQuick 2.0

BaseItem {
    id: iMagnet

    pXYWH: [1800, 550, 50, 50]
    pName: "Magnet"
    pSource: "Magnet.png"

    function onPickUp() {
        mConstants.magnetPickedUp = true
    }
}
