import QtQuick
import Felgo

import "../"
import "../../Controll"

BaseView {
    id: iStorageTable

    property bool pStringTaken: false

    pImageSource: "TableWithString.png"
    pNextView: iBigStorageRoom


    NavigationRect {
        id: takeString
        xPercent: 0.74
        yPercent: 0.42
        widthPercent: 0.08
        heightPercent: 0.13
        pEnabled: !pStringTaken
        functionOnClicked: function() {pStringTaken = true; calculateImage()}
    }

    function calculateImage() {
        if (!pStringTaken) {
            pImageSource = "TableWithString.png"
        }
        else {
            pImageSource = "TableWithoutString.png"
        }
    }

}


