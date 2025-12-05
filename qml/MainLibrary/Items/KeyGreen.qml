import QtQuick 2.0

BaseItem {
    id: greenKey

    pXYWH: [1800, 750, 50, 50]
    pName: "Key Green"
    pSource: "GreenKey.png"
    pUse: mConstants.mUseEnum.GREEN_KEY

    function onPickUp() {
        mConstants.greenKeyPickedUp = true
    }
}
