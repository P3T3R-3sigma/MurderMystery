import Felgo
import QtQuick

Item {
    id: iRotationItem
    property string pSource: ""
    property int pRotation: 0
    anchors.fill: parent

    rotation: pRotation

    AppImage {
        id: sourceImage1
        x: (parent.width - width)/2
        y: (parent.height - height)/2
        source: "../../../../../assets/Images/Circle_" + pSource + ".png" // Replace with your image path
        visible: true
    }

    NumberAnimation {
        id: iAnimation
        target: iRotationItem
        property: "rotation"
        onFinished: win()
    }

    function rotate(num) {
        iAnimation.to = rotation + num*30
        iAnimation.start()
    }
}
