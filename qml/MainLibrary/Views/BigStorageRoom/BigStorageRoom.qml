import QtQuick
import Felgo

import "../../Controll"
import "../"

BaseView {
    id: iBigStorageRoom
    objectName: "Big Storage Room"

    pImageSource: "BigStorageRoom.png"

    NavigationRect {
        xPercent: 0.73
        yPercent: 0.47
        widthPercent: 0.08
        heightPercent: 0.25
        functionOnClicked: function() {mFreezer.startFadeIn()}
    }
    // NavigationRect {
    //     xPercent: 0.13
    //     yPercent: 0.6
    //     widthPercent: 0.12
    //     heightPercent: 0.15
    //     functionOnClicked: function() {mStorageTable.startFadeIn()}
    // }

    Freezer {
        id: mFreezer
    }

    // StorageTable {
    //     id: mStorageTable
    // }

    Component.onCompleted: mPlaceManager.addPlace(this)

}
