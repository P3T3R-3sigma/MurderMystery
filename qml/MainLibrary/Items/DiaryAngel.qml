import QtQuick 2.0

BaseItem {
    id: angelDiary


    pXYWH: [1500, 650, 50, 50]
    pName: "Diary Angel"
    pSource: "Diary.png"

    function onPickUp() {
        mConstants.diaryAngelPickedUp = true
    }
}
