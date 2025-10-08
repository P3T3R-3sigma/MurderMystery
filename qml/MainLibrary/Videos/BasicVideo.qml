import QtQuick
import Felgo
import QtMultimedia

Item {
    id: mLoader

    anchors.fill: parent

    property real mVolume: 0
    property string mSource
    property real videoAspect: 16/9
    property real containerAspect: width / height
    property real scaledVideoWidth: containerAspect > videoAspect ? height * videoAspect : width
    property real scaledVideoHeight: containerAspect > videoAspect ? height : width / videoAspect
    property bool pAvailable: false
    property bool pVisited: false

    signal sVideoEnd()

    visible: false

    VideoOutput {
        id: mVideoOutput

        fillMode: VideoOutput.PreserveAspectFit

        anchors.fill: parent
        transform: [
            Scale {
                id: mVideoOutputScale
                origin.x: width / 2
                origin.y: height / 2
                xScale: 1.0
                yScale: 1.0
            }
        ]
    }

    MediaPlayer {
        id: mVideoMediaPlayer

        // source: mSource
        videoOutput: mVideoOutput
        loops: MediaPlayer.Infinite
        audioOutput: AudioOutput {
            volume: mVolume
        }
        onPlaybackStateChanged: {
            ///////////////////////////////
            // console.log("mediaStatus:", mediaStatus, "source:", source, "duration:", duration, "now:", Date.now())
            ///////////////////////////////
            if (mediaStatus === MediaPlayer.EndOfMedia) {
                pVisited = true
                sVideoEnd()
                ///////////////////////////////
                // console.log("End of media reached.")
                ///////////////////////////////
            } else if (mediaStatus === MediaPlayer.LoadedMedia) {
                ///////////////////////////////
                // console.log("Loaded", Date.now())
                ///////////////////////////////
            }
        }
    }


    onVisibleChanged: {
        if (visible) {
            mVideoMediaPlayer.play()
        } else {
            mVideoMediaPlayer.stop()
        }
    }


    function onInteract() {
        pVisited = true
        sVideoEnd()
    }

    function startVideo(){
        setVideoPosition(0)
        mVideoMediaPlayer.play()
    }
    function stopVideo(){
        mVideoMediaPlayer.stop()
    }
    function pauseVideo(){
        mVideoMediaPlayer.pause()
    }
    function playVideo(){
        mVideoMediaPlayer.play()
    }

    function getVideoOutputScale() {
        return mVideoOutputScale
    }
    function getVideoOutput() {
        return mVideoOutput
    }
    function getMediaPlayer() {
        return mVideoMediaPlayer
    }


    function getVideoState() {
        return mVideoMediaPlayer.playbackState
    }
    function getVideoDuration() {
        return mVideoMediaPlayer.duration
    }

    function getVideoSource() {
        return mSource
    }
    function getVideoPosition() {
        return mVideoMediaPlayer.position
    }
    function setVideoPosition(sPosition) {
        mVideoMediaPlayer.position = sPosition
    }
}


