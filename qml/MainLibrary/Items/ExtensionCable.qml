import QtQuick 2.0

BaseItem {
    id: extensionCable

    pXYWH: [1600, 550, 50, 50]
    pName: "Extension Cable"
    pSource: "ExtensionCord.png"
    pUse: mConstants.mUseEnum.EXTENSION_CABLE


    function onPickUp() {
        mConstants.extensionCablePickedUp = true
    }
}
