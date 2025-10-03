import QtQuick 2.0

BaseItem {
    id: closetAngel

    visible: true

    pXYWH: [1100, 150, 50, 50]
    pColor: "red"
    pName: "Diary Milan"

    function updateItem() {
        if (mClosetMilan.pPickedUp) {
            pAvailable = true
        }
        setVisual()
    }

    function onPickUp() {
        mMilan.makeVideo2Available()
    }
}
