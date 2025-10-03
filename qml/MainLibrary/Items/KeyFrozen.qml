import QtQuick 2.0

BaseItem {
    id: closetAngel

    visible: true

    pXYWH: [1300, 150, 50, 50]
    pColor: "red"
    pName: "Key Frozen"

    function updateItem() {
        if (mFridge.pPickedUp) {
            pAvailable = true
        }
        setVisual()
    }

}
