import Felgo
import QtQuick

Item {
    id: iItemMatcher
    anchors.fill: parent

    property var pFunctionToDo
    property var pArguments: []
    property var pItem1
    property var pItem2

    visible: false


    function match() {
        if (pItem1.pItemToMatch === pItem2) {
            pFunctionToDo(...pArguments)
        }
    }
}
