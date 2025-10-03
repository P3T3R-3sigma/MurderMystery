import QtQuick 2.0

BaseItem {
    id: closetAngel

    visible: true

    pXYWH: [1000, 150, 50, 50]
    pColor: "red"
    pName: "Diary Angel"


    function updateItem() {
        if (mClosetAngel.pPickedUp) {
            pAvailable = true
        }

        setVisual()
    }

    function onPickUp() {
        mAngel.makeVideo3Available()
    }
}
