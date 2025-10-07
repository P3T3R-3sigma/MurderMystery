import QtQuick
import Felgo

Rectangle {
    id: iNavigationRect

    property real xPercent
    property real yPercent
    property real widthPercent
    property real heightPercent
    property var functionOnClicked: null
    property bool pEnabled: true
    property string pSource: ""

    x: parent.width * xPercent
    y: parent.height * yPercent
    width:  parent.width * widthPercent
    height: parent.height * heightPercent

    visible: pEnabled
    color: "transparent"

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
            enabled: scene.mEnabled

            onEntered: {
                navRect.opacity = 0.5
            }
            onExited: {
                navRect.opacity = 0
            }
            onClicked: {
                if (functionOnClicked) {
                    if (scene.mCurrentScene === iNavigationRect.parent) {
                        console.log(scene.mCurrentScene, iNavigationRect.parent)
                        functionOnClicked()
                    }
                }
            }
        }
    }
}
