import QtQuick 2.0

BaseItem {
    id: milanDiary

    pXYWH: [1500, 550, 50, 50]

    pName: "Diary Milan"
    pSource: "Diary.png"

    function onPickUp() {
        mConstants.diaryMilanPickedUp = true
    }
}
