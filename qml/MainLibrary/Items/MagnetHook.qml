import QtQuick 2.0

BaseItem {
    id: magnetHook

    pXYWH: [1800, 650, 50, 50]
    pName: "Magnet Hook"

    function onPickUp() {
        mConstants.magnetHookPickedUp = true
    }
}
