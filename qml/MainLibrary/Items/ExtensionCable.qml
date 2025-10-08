import QtQuick 2.0

BaseItem {
    id: extensionCable

    pXYWH: [1600, 550, 50, 50]
    pName: "Extension Cable"
    pSource: "ExtensionCord.png"


    function onPickUp() {
        mConstants.extensionCablePickedUp = true
    }
}
