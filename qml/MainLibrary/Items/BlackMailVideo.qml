import QtQuick 2.0

BaseItem {
    id: iBlackMailVideo

    pXYWH: [1400, 650, 50, 50]
    
    pName: "Video of BlackMail"
    pSource: "MurderVideo.png"


    function onPickUp() {
        mConstants.blackMailVideoPickedUp = true
    }
}
