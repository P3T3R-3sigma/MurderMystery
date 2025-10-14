import Felgo 4.0
import QtQuick 2.0

BaseObject {
    color: "blue"
    Component.onCompleted: obstacle.push(this)
}
