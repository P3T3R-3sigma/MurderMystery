import Felgo 4.0
import QtQuick 2.0

import "MainLibrary/Characters"
import "MainLibrary/Items"
import "MainLibrary/Managers"
import "MainLibrary/Views/BigStorageRoom"
import "MainLibrary/Views/ChangingRoom"
import "MainLibrary/Puzzle/MagnetHook"

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

        property var mCurrentScene


        MainManager { id: mMainManager }

        CharacterManager { id: mCharacterManager }

        Angel { id: mAngel }
        Milan { id: mMilan }
        Costa { id: mCosta }
        Candee { id: mCandee }
        Heart { id: mHeart }
        Raul { id: mRaul}


        ItemManager { id: mItemManager }

        ClosetAngel { id: mClosetAngel; pAvailable: true }
        ClosetHeart { id: mClosetHeart; pAvailable: true }
        ClosetMilan { id: mClosetMilan; pAvailable: true }
        DiaryAngel { id: mDiaryAngel;}
        DiaryMilan { id: mDiaryMilan;}
        ExtensionCable { id: mExtensionCable;}
        Fridge { id: mFridge; pAvailable: true }
        Iron { id: mIron; pAvailable: true }
        KeyBlue { id: mKeyBlue;}
        KeyFrozen { id: mKeyFrozen;}
        KeyGreen { id: mKeyGreen;}
        KeyRed { id: mKeyRed;}
        Magnet { id: mMagnet; pAvailable: true }
        MagnetHook { id: mMagnetHook;}
        MainSafe { id: mMainSafe;}
        MoneyOfAmy { id: mMoneyOfAmy;}
        SideSafe { id: mSideSafe;}
        SideSafeGear { id: mSideSafeGear; pAvailable: true }
        String { id: mString; pAvailable: true }

        // MagnetHookGame {}

        BigStorageRoom {
            id: mBigStorageRoom

            pImageSource: "BigStorageRoom.png"
        }
        ChangingRoom {
            id: mChangingRoom

            pImageSource: "ChangingRoom.png"
        }

        Component.onCompleted: mChangingRoom.startFadeIn()
    }
}
