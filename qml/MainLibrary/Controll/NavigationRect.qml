import QtQuick
import Felgo

Rectangle {
    id: iNavigationRect

    property var pXYWH: []
    property var functionOnClicked: null
    property bool pEnabled: parent.pEnabled && pAdditionalEnable
    property bool pAdditionalEnable: true
    property string pSource: ""

    x: pXYWH[0]
    y: pXYWH[1]
    width: pXYWH[2]
    height: pXYWH[3]
    z: 2

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
                    functionOnClicked()
                }
            }
        }
    }
}
