import QtQuick
import Felgo

import "../"
import "../../Controll"

BaseView {
    id: iStorageTable

    property bool pStringTaken: false


    NavigationRect {
        id: takeString
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


