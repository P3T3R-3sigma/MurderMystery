import Felgo 4.0
import QtQuick 2.0

Item {
    id: baseInteract

    function interact() {
        console.log("ERROR: " + baseInteract + " > interact() needs to be overriden.")
    }
}
