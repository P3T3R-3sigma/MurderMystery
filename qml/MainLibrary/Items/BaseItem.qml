import QtQuick 2.0

import "../Interact"

InteractItem {
    id: baseItem

    property var pXYWH: [100, 100, 100, 100]
    property string pColor: "red"
    property string pName: ""

    property bool pAvailable: false
    property bool pPickedUp: false

    Rectangle {
        id: body

        x: pXYWH[0]
        y: pXYWH[1]
        width: pXYWH[2]
        height: pXYWH[3]
        color: pColor

        Text {
            anchors.fill: parent

            text: pName
            wrapMode: Text.WordWrap
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                interact(baseItem)
            }
        }
    }


    Component.onCompleted: {
        mItemManager.addItem(baseItem)
    }


    function onPickUp() {}
    function pickUp() {
        if (pAvailable && !pPickedUp) {
            baseItem.onPickUp()
            pPickedUp = true
            mMainManager.updateAll()
        }
    }

    function updateItem() {
        setVisual()
    }

    function setVisual() {
        if (pPickedUp) {
            pColor = "blue"
        } else if (pAvailable) {
            pColor = "green"
        } else {
            pColor = "red"
        }
    }
}
