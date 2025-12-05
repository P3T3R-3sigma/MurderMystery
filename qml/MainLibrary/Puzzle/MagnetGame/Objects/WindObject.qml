import Felgo
import QtQuick

BaseObject {
    id: iWind
    property bool windDir
    color: "lightgray"
    opacity: 0.5
    z: -1

    AppImage {
        id: iImage
        source: "../../../../../assets/Images/Wind.png"
        opacity: 0.7
        rotation: windDir ? 0 : 180
        x: windDir ? 0 : -900
    }
    NumberAnimation {
        target: iImage
        property: "x"
        to: windDir ? -900 : 0
        duration: 4000
        running: true
        onFinished: {
            iImage.x = (windDir ? 0 : -900)
            start()
        }
    }


    Component.onCompleted: windTunel.push(this)
}
