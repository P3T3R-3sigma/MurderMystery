import Felgo
import QtQuick
import QtMultimedia


AppImage {
    id: baseImage

    property var pXYWH: [0, 0, 0, 0]
    property string pAssetCode

    x: pXYWH[0]
    y: pXYWH[1]

    BaseLoader {
        id: iLoader
        pExtractFrom: "qrc:/image_assets.qrc"
    }

    // Rectangle {
    //     anchors.fill: parent
    //     color: "blue"
    //     opacity: 0.2
    // }

    function setSource(lSource) {
        iLoader.setSource(lSource)
    }
}
