import QtQuick 2.0

BaseItem {
    id: mainSafe

    visible: true

    pXYWH: [1300,350, 50, 50]
    pColor: "red"
    pName: "Main Safe"

    function updateItem() {
        if (mKeyBlue.pPickedUp && mKeyRed.pPickedUp && mKeyGreen.pPickedUp) {
            pAvailable = true
        }
        setVisual()
    }

    function onPickUp() {
        mCandee.makeVideo3Available()
    }
}
