import QtQuick 2.0

BaseItem {
    id: iHairDryer

    pXYWH: [1600, 650, 50, 50]
    pName: "Hair Dryer"
    pSource: "HairDryer.png"

    function onPickUp() {
        mConstants.hairDryerPickedUp = true
    }
}
