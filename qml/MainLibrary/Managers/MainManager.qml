import QtQuick 2.0

import "../Videos"

Item {
    id: iMainManager

    property var pManagers: []

    function addManager(manager) {
        pManagers.push(manager)
    }

    function listAll() {
        for (let i in pManagers) {
            pManagers[i].listContent()
        }
    }

    function updateAll() {
        for (let i in pManagers) {
            pManagers[i].updateContent()
        }
    }
}

