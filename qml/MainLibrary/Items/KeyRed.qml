import QtQuick 2.0

BaseItem {
    id: redKey

    pXYWH: [1400, 750, 50, 50]
    pName: "Key Red"
    pSource: "RedKey.png"
    pUse: mConstants.mUseEnum.RED_KEY

    function onPickUp() {
        mConstants.redKeyPickedUp = true
    }
}
