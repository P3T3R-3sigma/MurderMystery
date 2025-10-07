import QtQuick 2.0

BaseItem {
    id: angelDiary


    pXYWH: [1000, 50, 50, 50]
    pColor: "red"
    pName: "Diary Angel"
    pSource: "Diary.png"

    function onPickUp() {
        mAngel.makeVideo3Available()
    }
}
