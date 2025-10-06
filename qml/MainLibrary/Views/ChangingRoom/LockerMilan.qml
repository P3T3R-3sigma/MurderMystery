import QtQuick
import Felgo

import "../"
import "../../Controll"
import "../../Items"

BaseView {
    id: iLockers

    property bool pTookDiary: false
    property bool pTookString: false

    pImageSource: "LockerMilan.png"
    pNextView: mLocker

    NavigationRect {
        xPercent: 0.5
        yPercent: 0.6
        widthPercent: 0.1
        heightPercent: 0.1
        pEnabled: !pTookDiary
        pSource: "Diary.png"
        functionOnClicked: function() {pTookDiary = true; mDiaryMilan.pickUp() }
    }
    String {
        xPercent: 0.63
        yPercent: 0.6
        widthPercent: 0.1
        heightPercent: 0.1
    }



}


