import Felgo 4.0
import QtQuick 2.0

Interact {
    id: interactCharacter

    visible: false

    function interact(toDo) {
        toDo.start()
    }
}
