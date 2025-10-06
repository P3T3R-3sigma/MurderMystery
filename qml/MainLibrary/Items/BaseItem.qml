import QtQuick
import Felgo

import "../Interact"

InteractItem {
    id: baseItem

    property var pXYWH: [100, 100, 100, 100]
    property string pColor: "red"
    property string pName: ""


    property real xPercent
    property real yPercent
    property real widthPercent
    property real heightPercent

    property bool pAvailable: false
    property bool pPickedUp: false

    // Rectangle {
    //     id: body

    //     x: pXYWH[0]
    //     y: pXYWH[1]
    //     width: pXYWH[2]
    //     height: pXYWH[3]
    //     color: pColor

    //     Text {
    //         anchors.fill: parent

    //         text: pName
    //         wrapMode: Text.WordWrap
    //     }

    //     MouseArea {
    //         anchors.fill: parent
    //         onClicked: {
    //             interact(baseItem)
    //         }
    //     }
    // }


    AppImage {
        anchors.fill: parent
        source: pSource ? "../../../assets/Images/" + pSource : ""
    }

    Rectangle {
        id: navRect

        anchors.fill: parent

        color: "lightpink"
        opacity: 0


        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                navRect.opacity = 0.5
            }
            onExited: {
                navRect.opacity = 0
            }
            onClicked: {
                baseItem.pickUp()
            }
        }
    }


    Component.onCompleted: {
        mItemManager.addItem(baseItem)
    }


    function onPickUp() {}
    function pickUp() {
        baseItem.onPickUp()
        pPickedUp = true
        mMainManager.updateAll()
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
