import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

Item {
    id: iComputerVideoView

    anchors.fill: parent

    property real pStartX: 261
    property real pWidth: 434
    property real pStartY: 150
    property real pHeight: 28
    property real pSpaceX: 25
    property real pSpaceY: 22.5

    Item {
        x: pStartX
        y: pStartY
        Row {
            spacing: pSpaceX
            Repeater {
                model: 3
                Column {
                    spacing: pSpaceY
                    property int r1Index: index
                    Repeater {
                        model: 12

                        Rectangle {
                            id: navRect

                            width: pWidth
                            height: pHeight

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
                                    openVideo(r1Index, index)
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    function openVideo(i, j) {
        if (i === 0 && j === 0) {
            mConstants.videoMissing = true
            mMainManager.updateAll()
        } else if (i === 1 && j === 7) {
            mConstants.milanBlackmailSeen = true
            mMainManager.updateAll()
        }
    }
}
