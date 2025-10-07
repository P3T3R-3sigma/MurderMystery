import QtQuick 2.0

BaseItem {
    id: milanDiary

    pXYWH: [1100, 50, 50, 50]
    pColor: "red"
    pName: "Diary Milan"
    pSource: "Diary.png"

    function onPickUp() {
        mMilan.makeVideo2Available()
    }
}
