import QtQuick
import Felgo

Item {
    id: iMatcher
    anchors.horizontalCenter: parent.horizontalCenter

    width: iRow.implicitWidth
    height: iRow.implicitHeight
    Row {
        id: iRow
        spacing: 50
        MatcherSlot {
            id: iSlot1
        }
        Text {
            id: iMatchText
            anchors.verticalCenter: parent.verticalCenter
            text: qsTr("MATCH")

            font {
                pixelSize: 40
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    tryToMatch()
                }
            }
        }
        MatcherSlot {
            id: iSlot2
        }
    }

    function addItem(item) {
        if (iSlot1.pMatchItem === null) {
            iSlot1.pMatchItem = item
        } else if (iSlot2.pMatchItem === null) {
            iSlot2.pMatchItem = item
        } else {
            console.log("Matcher is full")
        }
    }

    function tryToMatch() {
        if (iSlot1.pMatchItem === null || iSlot2.pMatchItem === null) {
            console.log("Matcher is not full.")
        } else {
            if (iSlot1.pMatchItem.pUse === mConstants.pMatchWith[iSlot2.pMatchItem.pUse] || iSlot2.pMatchItem.pUse === mConstants.pMatchWith[iSlot1.pMatchItem.pUse]) {
                scene.mCurrentScene.useItem(iSlot1.pMatchItem)
                scene.mCurrentScene.useItem(iSlot2.pMatchItem)
                if (!iSlot1.pMatchItem.pNeeded) {
                    removeItem(iSlot1.pMatchItem.pUse)
                    iSlot1.removeItem()
                }
                if (!iSlot2.pMatchItem.pNeeded) {
                    removeItem(iSlot2.pMatchItem.pUse)
                    iSlot2.removeItem()
                }

            } else {
                console.log("Could not match " + iSlot1.pMatchItem.pName + " with " + iSlot2.pMatchItem.pName)
            }

        }
    }
}
