import QtQuick 2.0

import "../Videos"

Item {
    id: iCharacterManager
    anchors.fill: parent

    property var pCharacters: []

    function addCharacter(character) {
        pCharacters.push(character)
    }
    function getCharacter(lName) {
        for (let i in pCharacters) {
            if (pCharacters[i].pName === lName) {
                return pCharacters[i]
            }
        }
    }

    function listContent() {
        for (let i in pCharacters) {
            console.log(pCharacters[i])
        }
    }

    function updateContent() {
        for (let i in pCharacters) {
            pCharacters[i].setNextAvailable()
        }
    }


    Component.onCompleted: mMainManager.addManager(iCharacterManager)
}

