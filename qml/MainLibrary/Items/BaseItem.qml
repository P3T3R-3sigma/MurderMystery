import QtQuick
import Felgo

import "../../BaseLibrary"

Item {
    id: baseItem

    property var pXYWH: [100, 100, 100, 100]
    property string pColor: pPickedUp ? "blue" : "red"
    property string pName: ""
    objectName: pName


    property string pSource: ""
    property string pCode: "ITEM" + pUse
    property string pDescription: "This is " + pName + iImage.source
    property int pUse: mConstants.mUseEnum.NOTHING

    property bool pEnabled: true
    property bool pPickedUp: false
    property bool pNeeded: false


    visible: !pPickedUp

    width: iImage.implicitWidth
    height: iImage.implicitHeight

    BaseImage {
        id: iImage
        anchors.fill: parent
        pAssetCode: pCode
    }

    Rectangle {
        id: iPickupRect
        anchors.fill: parent

        color: "lightpink"
        opacity: 0
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            enabled: pEnabled

            onEntered: iPickupRect.opacity = 0.5
            onExited: iPickupRect.opacity = 0
            onClicked: baseItem.pickUp()
        }
    }


    Component.onCompleted: {
        mItemManager.addItem(baseItem)
    }


    function onPickUp() {}
    function pickUp() {
        baseItem.onPickUp()
        pPickedUp = true
        mInventory.addToInventory(this)
        mMainManager.updateAll()
    }

    function updateItem() {

    }
}
