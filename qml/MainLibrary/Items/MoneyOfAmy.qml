import QtQuick 2.0

BaseItem {
    id: moneyOfAmy

    visible: true

    pXYWH: [1000, 250, 50, 50]
    pColor: "red"
    pName: "Money of Amy"

    function updateItem() {
        if (mClosetAngel.pPickedUp) {
            pAvailable = true
        }
        setVisual()
    }

    function onPickUp() {
        mAngel.makeVideo2Available()
    }
}
