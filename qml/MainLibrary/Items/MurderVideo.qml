import QtQuick 2.0

BaseItem {
    id: iMurderVideo

    pXYWH: [1600, 850, 50, 50]
    
    pName: "Video of Murder"
    pSource: "MurderVideo.png"


    function onPickUp() {
        mConstants.murderVideoPickedUp = true
    }
}
