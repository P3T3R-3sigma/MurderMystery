import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

Item {
    id: iComputerVideoView

    anchors.fill: parent

    property real pStartXPercent: 0.136
    property real pWidhtPercent: 0.226
    property real pStartYPercent: 0.1388
    property real pHeightPercent: 0.026
    property real pSpaceXPercent: 0.0129
    property real pSpaceYPercent: 0.0208

    Item {
        x: pStartXPercent * parent.width
        y: pStartYPercent * parent.height
        Row {
            spacing: pSpaceXPercent * iComputerVideoView.width
            Repeater {
                model: 3
                Column {
                    spacing: pSpaceYPercent * iComputerVideoView.height
                    property int r1Index: index
                    Repeater {
                        model: 12

                        Rectangle {
                            id: navRect

                            width: pWidhtPercent * iComputerVideoView.width
                            height: pHeightPercent * iComputerVideoView.height

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
