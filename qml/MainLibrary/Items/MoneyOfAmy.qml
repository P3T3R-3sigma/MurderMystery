import QtQuick 2.0

BaseItem {
    id: moneyOfAmy

    pXYWH: [1000, 150, 50, 50]
    pColor: "red"
    pName: "Money of Amy"

    function onPickUp() {
        mAngel.makeVideo2Available()
    }
}
