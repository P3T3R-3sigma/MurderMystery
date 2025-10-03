import QtQuick 2.0

BaseItem {
    id: closetAngel

    visible: true

    pXYWH: [1200, 150, 50, 50]
    pColor: "red"
    pName: "Extension Cable"


    function updateItem() {
        if (mClosetHeart.pPickedUp) {
            pAvailable = true
        }
        setVisual()
    }
}
