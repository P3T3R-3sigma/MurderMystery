import Felgo
import QtQuick

import "Objects"

Item {
    id: iGearGame

    property var pListGears: []
    property var pBackView

    anchors.fill: parent
    visible: false


    BaseObject {}
    BaseObject {}
    BaseObject {
        pSize: parent.width * 0.1 * ((Math.sqrt(1*1 + 1/2*1/2))-(Math.sqrt(2) - 1/2))*2
    }
    BaseObject {
        pSize: parent.width * 0.1 * (Math.sqrt(2) - 1/2)*2
    }
    BaseObject {
        pSize: parent.width * 0.1 * (Math.sqrt(2) - 1/2)*2
    }
    BaseObject {
        id: starterGear
        pEnabled: false
        pConnected: true
    }
    BaseObject {
        id: endGear
        pEnabled: false

        function win() {
            if (pDir === 1) {
                iBackgraound.color = "green"
                iTimer.start()
            }
            else if (pDir === -1) {
                iBackgraound.color = "red"
            }
        }
    }

    Timer {
        id: iTimer
        interval: 2000

        onTriggered: {
            startFadeOut()
        }
    }

    Rectangle {
        id: iBackgraound
        anchors.fill: parent
        color: "lightblue"
        z: -2
    }

    Grid {
        id: mGrid
        z: -1
    }



    function calculateRotation() {
        for (let k in pListGears) {
            if (pListGears[k] !== starterGear) {
                pListGears[k].stopRotate()
            }
        }
        shadowCalculateRotation()
    }

    function shadowCalculateRotation() {
        for (let i in pListGears) {
            if (pListGears[i].pDir !== 0) {
                let gear1 = pListGears[i]
                for (let j in pListGears) {
                    if (pListGears[j] !== starterGear && pListGears[j] !== gear1) {
                        let gear2 = pListGears[j]
                        if (Math.sqrt(Math.pow((gear1.centerX - gear2.centerX), 2) + Math.pow((gear1.centerY - gear2.centerY), 2)) < (gear1.pSize + gear2.pSize)/2) {
                            if (Math.sqrt(Math.pow((gear1.centerX - gear2.centerX), 2) + Math.pow((gear1.centerY - gear2.centerY), 2)) < (gear1.pSize + gear2.pSize)/2*0.9) {
                                if (gear2 !== endGear) {
                                    gear2.x = 100-gear2.width/2
                                    gear2.y = 100-gear2.height/2
                                    gear2.stopRotate()
                                }
                                if (gear1 !== starterGear) {
                                    gear1.x = 100-gear1.width/2
                                    gear1.y = 100-gear1.height/2
                                    gear1.stopRotate()
                                }
                                shadowCalculateRotation()
                                return
                            } else if (gear2.pDir === 0) {
                                gear2.pDir = -gear1.pDir
                                gear2.pRotationTime = gear2.pSize/gear1.pSize * gear1.pRotationTime
                                gear2.rotate()
                                shadowCalculateRotation()
                                return
                            } else if (gear2.pDir !== -gear1.pDir) {
                                if (gear2 !== endGear) {
                                    gear2.x = 100-gear2.width/2
                                    gear2.y = 100-gear2.height/2
                                    gear2.stopRotate()
                                }
                                if (gear1 !== starterGear) {
                                    gear1.x = 100-gear1.width/2
                                    gear1.y = 100-gear1.height/2
                                    gear1.stopRotate()
                                }
                                shadowCalculateRotation()
                                return
                            }
                        }
                    }
                }
            }
        }
    }

    AppButton {
        anchors.right: parent.right
        text: "Reset"

        onClicked: reset()
    }

    function reset() {
        for (let i in pListGears) {
            let gear1 = pListGears[i]
            if (gear1 !== starterGear && gear1 !== endGear) {
                gear1.x = 100-gear1.width/2
                gear1.y = 100-gear1.height/2
                gear1.stopRotate()
            }
        }
        endGear.stopRotate()
        iBackgraound.color = "lightblue"
    }

    function startFadeIn() {
        visible = true
        starterGear.pDir = 1
        starterGear.rotate()
        scene.mCurrentScene = iGearGame
    }
    function startFadeOut() {
        pSafeOpen = true
        reset()
        starterGear.stopRotate()
        calculateImage()
        visible = false
        pBackView.startFadeIn()
    }


    onVisibleChanged: {
        if (visible) {
            let place = mGrid.shouldSnap(0, 0, parent.width * (0.2 + 1/80/2), parent.height * (0.25 + 1/80/2*16/9))
            starterGear.x = place.x-starterGear.width/2
            starterGear.y = place.y-starterGear.height/2

            place = mGrid.shouldSnap(0, 0, parent.width * (0.2 + 1/80/2 + 0.048*8), parent.height * (0.25 + 1/80/2*16/9 + 0.048*5*16/9))
            endGear.x = place.x-endGear.width/2
            endGear.y = place.y-endGear.height/2
        }
    }

}
