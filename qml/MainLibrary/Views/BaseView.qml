import QtQuick
import Felgo

import "../Controll"

Item {
    id: baseView

    property string pImageSource: ""
    property var pNextView: null
    property var pBackView: scene

    visible: false
    anchors.fill: parent
    opacity: 1

    AppImage {
        anchors.fill: parent

        source: "../../../assets/Images/" + pImageSource
    }

    NavigationRect {
        id: goBack
        xPercent: 0.9
        yPercent: 0
        widthPercent: 0.1
        heightPercent: 0.1
        pEnabled: baseView === scene.mCurrentScene
        functionOnClicked: function() {
            startFadeOut(pBackView)
        }
    }

    function startFadeOut(lNext) {
        pNextView = lNext
        scene.mCurrentScene = pNextView
        baseView.visible = false
        if (pNextView) {
            pNextView.startFadeIn()
        }
    }

    function startFadeIn() {
        scene.mCurrentScene = baseView
        baseView.visible = true
    }



}


