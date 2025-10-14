import Felgo 4.0
import QtQuick 2.0

BaseObject {
    color: "gold"

    function collide(circle) {
        if (Math.sqrt((circle.x-this.x)*(blob.x-this.x) + (blob.y-this.y)*(blob.y-this.y)) < 30 ) {
            return true
        }
        return false
    }

}
