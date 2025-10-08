import QtQuick 2.0

BaseItem {
    id: sideSafeGear

    pXYWH: [1400, 550, 50, 50]
    pName: "Side Safe Gear"
    pSource: "SideSafeGear.png"

    function onPickUp() {
        mConstants.safeGearPickedUp = true
    }
}
