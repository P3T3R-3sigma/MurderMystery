import Felgo 4.0
import QtQuick 2.0

Interact {
    id: interactItem

    visible: false

    function interact(item) {
        item.pickUp()
    }
}
