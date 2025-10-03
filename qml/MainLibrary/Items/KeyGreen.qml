import QtQuick 2.0

BaseItem {
    id: closetAngel

    visible: true

    pXYWH: [1500, 250, 50, 50]
    pColor: "red"
    pName: "Key Green"

    function updateItem() {
        if (mMagnetHook.pPickedUp && mCandee.pDropedKey) {
            pAvailable = true
        }
        setVisual()
    }
}
