import Felgo
import QtQuick

Item {
    id: iBaseObject

    property real pSize: scene.width * 0.1
    property bool pEnabled: true
    property int pDir: 0
    property bool pConnected: false
    property real pRotationTime: 10000
    property real centerX: x+width/2
    property real centerY: y+height/2

    onPDirChanged: {
        if (pDir !== 1 && pDir !== -1 && pDir !== 0) {
            console.log("ERROR: pDir = ", pDir)
        }
    }

    rotation: 0

    visible: true
    x: 100 - width/2
    y: 100 - height/2

    width: pSize
    height: width
    AppImage {
        id: sourceImage1
        anchors.fill: parent
        source: "../../../../../assets/Images/MiniGameGear.png"
        visible: true
    }

    NumberAnimation {
        id: iAnimation
        target: iBaseObject
        duration: pRotationTime
        property: "rotation"
        onFinished: rotate()
    }

    MouseArea {
        anchors.fill: parent
        enabled: pEnabled

        onPressed: {
            iAnimation.stop()
            iBaseObject.rotation = 0
            pDir = 0
        }

        onReleased: function(mouse) {
            let place = mGrid.shouldSnap(100, 100, iBaseObject.x + mouse.x, iBaseObject.y + mouse.y)
            iBaseObject.x = place.x-iBaseObject.width/2
            iBaseObject.y = place.y-iBaseObject.height/2
            calculateRotation(iBaseObject)
            endGear.win()
        }
        onPositionChanged: function(mouse) {
            iBaseObject.x += mouse.x-iBaseObject.width/2
            iBaseObject.y += mouse.y-iBaseObject.height/2
        }
    }
    function rotate() {
        visible = true
        rotation = 0
        iAnimation.to = 360 * pDir
        iAnimation.start()
    }
    function stopRotate() {
        iAnimation.stop()
        rotation = 0
        pDir = 0
    }

    Component.onCompleted: pListGears.push(iBaseObject)
}
