import QtQuick 2.0

BaseItem {
    id: sideSafe

    visible: true

    pXYWH: [1800, 150, 50, 50]
    pColor: "red"
    pName: "Side Safe"

    function updateItem() {
        if (mSideSafeGear.pPickedUp) {
            pAvailable = true
        }
        setVisual()
    }

    function onPickUp() {
        mHeart.makeVideo3Available()
    }
}
