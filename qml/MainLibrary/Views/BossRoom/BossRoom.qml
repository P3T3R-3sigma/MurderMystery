import QtQuick
import Felgo

import "../../Controll"
import "../"

BaseView {
    id: iBossRoom
    objectName: "Boss's Room"
    pImageSource: "BossRoom.png"
    pBackView: mMainRoom

    NavigationRect {
        xPercent: 0.01
        yPercent: 0.22
        widthPercent: 0.11
        heightPercent: 0.35
        functionOnClicked: function() { mPictureOnWall.startFadeIn()}
    }
    NavigationRect {
        xPercent: 0.45
        yPercent: 0.53
        widthPercent: 0.35
        heightPercent: 0.35
        functionOnClicked: function() { mDeskOfHeart.startFadeIn()}
    }
    NavigationRect {
        xPercent: 0.88
        yPercent: 0.33
        widthPercent: 0.12
        heightPercent: 0.45
        pEnabled: true
        functionOnClicked: function() {mClosetHeart.startFadeIn()}
    }

    ClosetHeart {
        id: mClosetHeart
    }

    PictureOnWall {
        id: mPictureOnWall
    }
    DeskOfHearts {
        id: mDeskOfHeart
    }

    Component.onCompleted: mPlaceManager.addPlace(this)

}
