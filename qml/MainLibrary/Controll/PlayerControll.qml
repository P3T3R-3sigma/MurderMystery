import QtQuick 2.0
import QtQuick.Controls 2.0

Item {
    id: iPlayerControll

    property bool isJumping: false
    property bool isMovingLeft: false
    property bool isMovingRight: false

    focus: true

    Keys.onPressed: function(event) {

        console.log("HERE")
        if (event.key === Qt.Key_Space) {
            isJumping = true
        }
        if (event.key === Qt.Key_A || event.key === Qt.Key_Left) {
            isMovingLeft = true
            isMovingRight = false
        }
        if (event.key === Qt.Key_D || event.key === Qt.Key_Right) {
            isMovingRight = true
            isMovingLeft = false
        }
    }

    Keys.onReleased: function(event) {
        if (event.key === Qt.Key_Space && !event.isAutoRepeat) {
            isJumping = false
        }
        if (event.key === Qt.Key_A || event.key === Qt.Key_Left) {
            isMovingLeft = false
        }
        if (event.key === Qt.Key_D || event.key === Qt.Key_Right) {
            isMovingRight = false
        }
    }

    Component.onCompleted: {
        console.log("PlayerControll initialized, focus:", focus)
        if (!focus) {
            forceActiveFocus() // Force focus at startup
        }
    }
}
