import QtQuick
import Felgo
import QtMultimedia

Item {
    id: mLoader

    anchors.fill: parent

    property real pVolume: 1
    property string pSource: ""
    property bool pAvailable: false
    property bool pVisited: false

    signal sVideoEnd()

    visible: false

    VideoOutput {
        id: iVideoOutput

        anchors.fill: parent
        fillMode: VideoOutput.PreserveAspectFit
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            stopVideo()
            pVisited = true
            mLoader.visible = false
            sVideoEnd()
            console.log("HERE 0", mLoader.visible)
        }
    }

    MediaPlayer {
        id: iVideoMediaPlayer

        source: pSource
        videoOutput: iVideoOutput
        audioOutput: AudioOutput {
            volume: pVolume
        }
        onMediaStatusChanged: {
            if (mediaStatus === MediaPlayer.EndOfMedia) {
                pVisited = true
                mLoader.visible = false
                sVideoEnd()
                console.log("HERE 1", mLoader.visible)
            }
        }
    }

    onVisibleChanged: {
        if (visible) {
            startVideo()
        } else {
            stopVideo()
        }
    }

    function onInteract() {
        pVisited = true
        if (pSource) {
            visible = true
        } else {
            sVideoEnd()
        }
    }

    function startVideo(){
        setVideoPosition(0)
        iVideoMediaPlayer.play()
    }
    function stopVideo(){
        iVideoMediaPlayer.stop()
    }
    function pauseVideo(){
        iVideoMediaPlayer.pause()
    }
    function playVideo(){
        iVideoMediaPlayer.play()
    }

    function getVideoOutput() {
        return iVideoOutput
    }
    function getMediaPlayer() {
        return iVideoMediaPlayer
    }


    function getVideoState() {
        return iVideoMediaPlayer.playbackState
    }
    function getVideoDuration() {
        return iVideoMediaPlayer.duration
    }

    function getVideoSource() {
        return iVideoMediaPlayer.source
    }
    function getVideoPosition() {
        return iVideoMediaPlayer.position
    }
    function setVideoPosition(sPosition) {
        iVideoMediaPlayer.position = sPosition
    }
}


