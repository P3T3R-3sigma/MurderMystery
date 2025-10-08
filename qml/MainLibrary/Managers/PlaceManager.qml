import QtQuick 2.0

import "../Videos"

Item {
    id: iPleceManager
    anchors.fill: parent

    property var pPlaces: []

    function addPlace(place) {
        pPlaces.push(place)
        pPlaces = pPlaces
    }

    function listContent() {
        for (let i in pPlaces) {
            console.log(pPlaces[i])
        }
    }

    function updateContent() {
        return
    }

    Component.onCompleted: mMainManager.addManager(iPleceManager)
}

