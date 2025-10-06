import QtQuick
import Felgo

import "../Controll"

Item {
    id: baseView

    property string pImageSource: ""
    property var pNextView: null

    visible: false
    anchors.fill: parent
    opacity: 0

    AppImage {
        anchors.fill: parent

        source: "../../../assets/Images/" + pImageSource
    }

    NavigationRect {
        id: goBack
        xPercent: 0.8
        yPercent: 0
        widthPercent: 0.2
        heightPercent: 0.2
        pEnabled: baseView === scene.mCurrentScene
        functionOnClicked: function() {
            startFadeOut(pNextView)
        }
    }

    ParallelAnimation {
        id: iParallelAnimationChoice

        running: false
        loops: 1
        NumberAnimation {
            id: iNumberAnimationOpacity
            target: baseView
            property: "opacity"
            duration: 500
        }
    }
    function startFadeOut(lNext) {
        pNextView = lNext
        scene.mCurrentScene = pNextView
        iNumberAnimationOpacity.to = 0
        iParallelAnimationChoice.running = true
    }

    function startFadeIn() {
        scene.mCurrentScene = baseView
        baseView.visible = true
        iNumberAnimationOpacity.to = 1
        iParallelAnimationChoice.running = true
    }



}


