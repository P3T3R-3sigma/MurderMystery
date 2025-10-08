import QtQuick 2.0

BaseItem {
    id: greenKey

    pXYWH: [1800, 750, 50, 50]
    pName: "Key Green"
    pSource: "GreenKey.png"

    function onPickUp() {
        mConstants.greenKeyPickedUp = true
    }
}
