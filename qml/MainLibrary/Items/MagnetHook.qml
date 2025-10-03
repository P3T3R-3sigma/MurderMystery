import QtQuick 2.0

BaseItem {
    id: closetAngel

    visible: true

    pXYWH: [1500, 150, 50, 50]
    pColor: "red"
    pName: "Magnet Hook"

    function updateItem() {
        if (mMagnet.pPickedUp && mString.pPickedUp) {
            pAvailable = true
        }
        setVisual()
    }
}
