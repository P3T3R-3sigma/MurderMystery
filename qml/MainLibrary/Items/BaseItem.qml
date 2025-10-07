import QtQuick
import Felgo

import "../Interact"

Rectangle {
    id: baseItem

    property var pXYWH: [100, 100, 100, 100]
    property string pColor: "red"
    property string pName: ""

    property real xPercent
    property real yPercent
    property real widthPercent
    property real heightPercent

    property string pSource: ""

    property bool pPickedUp: false

    x: parent.width * xPercent
    y: parent.height * yPercent
    width:  parent.width * widthPercent
    height: parent.height * heightPercent

    color: "transparent"
    visible: !pPickedUp


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
        } else {
            pColor = "red"
        }
    }
}
