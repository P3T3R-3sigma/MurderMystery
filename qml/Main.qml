import Felgo 4.0
import QtQuick 2.0

import "MainLibrary/Characters"
import "MainLibrary//Controll"
import "MainLibrary/Items"
import "MainLibrary/Managers"
import "MainLibrary/Views/BigStorageRoom"
import "MainLibrary/Views/ChangingRoom"
import "MainLibrary/Views/VIP_Alcove"
import "MainLibrary/Views/MakeUpRoom"
import "MainLibrary/Views/BossRoom"
import "MainLibrary/Views/MainRoom"
import "MainLibrary/Puzzle/MagnetGame"
import "MainLibrary/Inventory"
import "MainLibrary"

GameWindow {
    id: gameWindow

    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"

    activeScene: scene

    // the size of the Window can be changed at runtime by pressing Ctrl (or Cmd on Mac) + the number keys 1-8
    // the content of the logical scene size (480x320 for landscape mode by default) gets scaled to the window size based on the scaleMode
    // you can set this size to any resolution you would like your project to start with, most of the times the one of your main target device
    // this resolution is for iPhone 4 & iPhone 4S
    screenWidth: 1920
    screenHeight: 1080

    Scene {
        id: scene

        // the "logical size" - the scene content is auto-scaled to match the GameWindow size
        width: 1920
        height: 1080

        property var mCurrentScene: scene
        property bool mEnabled: true

        AppImage {
            anchors.fill: parent
            visible: scene.mCurrentScene === scene
            source: "../assets/Images/MapOfRooms.png"
        }

        Inventory {
            id: mInventory;
            z: 10
        }

        MainManager { id: mMainManager }
        Constants { id: mConstants }

        CharacterManager { id: mCharacterManager }



        ItemManager { id: mItemManager }
        MagnetHook { id: mMagnetHook }

        PlaceManager { id: mPlaceManager }

        BigStorageRoom { id: mBigStorageRoom }
        ChangingRoom { id: mChangingRoom }
        VIP_Alcove { id: mVIP_Alcove }
        MakeUpRoom { id: mMakeUpRoom}
        BossRoom { id: mBossRoom }
        MainRoom { id: mMainRoom }
        BarView { id: mBarView }
        SideView { id: mSideView }


        NavigationRect {
            xPercent: 0.703
            yPercent: 0.175
            widthPercent: 0.273
            heightPercent: 0.245
            pEnabled: scene.mCurrentScene === scene
            functionOnClicked: function() {mBigStorageRoom.startFadeIn()}
        }
        NavigationRect {
            xPercent: 0.2235
            yPercent: 0.35
            widthPercent: 0.4765
            heightPercent: 0.52
            pEnabled: scene.mCurrentScene === scene
            functionOnClicked: function() {mMainRoom.startFadeIn()}
        }
        NavigationRect {
            xPercent: 0.03
            yPercent: 0.63
            widthPercent: 0.191
            heightPercent: 0.241
            pEnabled: scene.mCurrentScene === scene
            functionOnClicked: function() {mVIP_Alcove.startFadeIn()}
        }
        NavigationRect {
            xPercent: 0.03
            yPercent: 0.35
            widthPercent: 0.191
            heightPercent: 0.28
            pEnabled: scene.mCurrentScene === scene
            functionOnClicked: function() {mMakeUpRoom.startFadeIn()}
        }
        NavigationRect {
            xPercent: 0.03
            yPercent: 0.105
            widthPercent: 0.191
            heightPercent: 0.242
            pEnabled: scene.mCurrentScene === scene
            functionOnClicked: function() {mChangingRoom.startFadeIn()}
        }
        NavigationRect {
            xPercent: 0.2235
            yPercent: 0.105
            widthPercent: 0.475
            heightPercent: 0.242
            pEnabled: scene.mCurrentScene === scene
            functionOnClicked: function() {mBossRoom.startFadeIn()}
        }
        function startFadeIn() {
            mCurrentScene = scene
            scene.mEnabled = true
        }
    }
}
