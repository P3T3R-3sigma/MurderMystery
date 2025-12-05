import Felgo
import QtQuick

import "Physics"
import "Objects"

Item {
    id: iMagnetGame
    anchors.fill: parent

    visible: false

    property var obstacle: []
    property var windTunel: []
    property int pDir: 0
    property bool stuck: false
    property bool gotKey: false

    // Update forces

    // Physics update: Euler method for θ'' = - (g/l) sin θ
    Timer {
        id: physicsTimer
        interval: mPhysics.dt * 1000
        repeat: true
        onTriggered: {
            if(stuck) {
                mPhysics.updateAngles()
            } else {
                mPhysics.update()
            }

            colision()
            win()
        }
    }

    function startFadeIn() {
        physicsTimer.start()
        this.visible = true
        mPhysics.reset()
    }

    function colision() {
        for (let i in obstacle) {
            if (obstacle[i].collide(blob)) {
                stuck = true
            }
        }
        for (let j in windTunel) {
            if (windTunel[j].collide(blob)) {
                if (windTunel[j].windDir) {
                    pDir = 1
                } else {
                    pDir = -1
                }
                return
            }
        }
        pDir = 0
    }
    function win() {
        if (mWinObject.collide(blob)) {
            if (gotKey) {
                mPhysics.reset()
                this.visible = false
                physicsTimer.stop()
                mKeyGreen.pickUp()
                mInventory.removeItem(mConstants.mUseEnum.MAGNETHOOK)
            }
        }

        if (mKey.collide(blob)) {
            blob.color = "gold"
            gotKey = true
            mKey.visible = false
        }
    }


    // Blob
    Rectangle {
        id: blob
        x: mPhysics.blobX - 15
        y: mPhysics.blobY - 15
        width: 30; height: 30
        radius: 15
        color: "red"
    }

    Rectangle {
        x: parent.width * (0.5 - 0.2)
        y: 0
        width: parent.width * 2*0.2
        height: parent.height
        z: -2

        color: "grey"
    }

    KeyObject {
        id: mKey
        x: 900
        y: 920
        width: 30
        height: 30
        radius: 15
    }

    Obstacles { pXYWH: [1000, 400, 500, 20] }
    Obstacles { pXYWH: [700, 550, 400, 20] }
    WindObject { pXYWH: [parent.width*0.3, parent.height * 0.4, parent.width*0.4, parent.height * 0.1]; windDir: true }
    Obstacles { pXYWH: [900, 550, 20, 120] }
    Obstacles { pXYWH: [700, 770, 200, 20] }
    Obstacles { pXYWH: [1000, 770, 200, 20] }
    WindObject { pXYWH: [parent.width*0.3, parent.height * 0.6, parent.width*0.4, parent.height * 0.1]; windDir: false }
    Obstacles { pXYWH: [250, 950, 1500, 200] }

    Obstacles { pXYWH: [0, 0, parent.width*0.3, parent.height] }
    Obstacles { pXYWH: [parent.width*0.7, 0, parent.width*0.3, parent.height] }

    WinObject { id: mWinObject; pXYWH: [parent.width*0.3, parent.height * 0.08, parent.width*0.4, parent.height * 0.1] }

    // Reset button
    Rectangle {
        x: parent.width-width
        y: 0
        width: 300
        height: 150
        color: "green"
        Text {
            anchors.centerIn: parent
            text: "Reset"
            font.pixelSize: 40
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                mPhysics.reset()
            }
        }

    }

    InGameMagnetHook {
        id: mMagnetHook
    }

    Physics {
        id: mPhysics
    }
}
