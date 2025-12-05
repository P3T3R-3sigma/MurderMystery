import QtQuick
import Felgo
import QtMultimedia

import "../"
import "../../Items"
import "../../Videos"
import "../../Controll"
import "../../Characters"
import "../../Puzzle/MagnetGame"

BaseView {
    id: iMainRoom
    objectName: "Main Room"
    pImageSource: "MainRoom.png"
    pBackView: scene

    VideoOutput {
        id: iVideoOutput

        anchors.fill: parent
        fillMode: VideoOutput.PreserveAspectFit
    }

    MediaPlayer {
        id: iVideoMediaPlayer

        source: "../../../../assets/testVideo/Strip club compositing test 03.mp4"
        videoOutput: iVideoOutput
        loops: MediaPlayer.Infinite
        audioOutput: AudioOutput {
            volume: 1
        }
    }

    onVisibleChanged: {
        if (visible) {
            iVideoMediaPlayer.play()
            console.log("HERE: " + iVideoMediaPlayer.source)
        } else {
            iVideoMediaPlayer.stop()
        }
    }

    NavigationRect {
        pXYWH: [1200, 570, 80, 150]

        functionOnClicked: function() { changeRoom(mOffice) }
    }
    NavigationRect {
        pXYWH: [0, 550, 450, 450]

        functionOnClicked: function() { changeRoom(mVIP_Alcove) }
    }
    NavigationRect {
        pXYWH: [1540, 550, 100, 120]

        functionOnClicked: function() { changeRoom(mLockers) }
    }

    NavigationRect {
        pXYWH: [570, 750, 117, 122]

        visible: mConstants.candeeDropedTheKey && !mConstants.greenKeyPickedUp
        functionOnClicked: function() { iPopUp.visible = true }
    }

    Angel { id: mAngel }
    Candee { id: mCandee }
    Milan { id: mMilan }
    Heart { id: mHeart }


    BaseItem {
        id: greenKey
        visible: false

        pXYWH: [1800, 750, 50, 50]
        pName: "Key Green"
        pUse: mConstants.mUseEnum.GREEN_KEY
    }

    MagnetGame { id: mMagnetGame }

    function startFadeIn(idx = 0) {
        iMainRoom.visible = true
        scene.mCurrentScene = iMainRoom
    }


    function changeRoom(room) {
        iMainRoom.visible = false
        room.startFadeIn(0)
    }

    Component.onCompleted: mPlaceManager.addPlace(this)

}

