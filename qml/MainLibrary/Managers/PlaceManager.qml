import QtQuick 2.0

import "../Videos"

Item {
    id: iPleceManager
    anchors.fill: parent

    property var pPlaces: []

    visible: true

    Repeater {
        id: irepeater
        model: pPlaces.length

        Rectangle {
            x: 100 + index*200
            y: 400
            width: 100
            height: 100
            color: "blue"

            Text {
                anchors.fill: parent
                text: pPlaces[index].objectName
                wrapMode: Text.WordWrap
            }
            MouseArea {
                anchors.fill: parent
                enabled: scene.mCurrentScene === null
                onClicked: { pPlaces[index].startFadeIn() }
            }
        }
    }

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

