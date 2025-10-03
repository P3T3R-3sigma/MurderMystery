import QtQuick 2.0

BaseItem {
    id: closetAngel

    visible: true

    pXYWH: [1300, 250, 50, 50]
    pColor: "red"
    pName: "Key Blue"

    function updateItem() {
        if (mKeyFrozen.pPickedUp && mIron.pPickedUp && mExtensionCable.pPickedUp) {
            pAvailable = true
        }
        setVisual()
    }
}
