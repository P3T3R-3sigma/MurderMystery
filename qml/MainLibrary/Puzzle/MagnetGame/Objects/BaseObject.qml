import Felgo 4.0
import QtQuick 2.0

Rectangle {
    id: iBaseObject

    property var pXYWH: [0, 0, 0, 0]
    visible: true

    x: pXYWH[0]
    y: pXYWH[1]
    z: -1
    width: pXYWH[2]
    height: pXYWH[3]
    color: "blue"

    function collide(circle) {
        // Rectangle properties
        let rectLeft = iBaseObject.x;
        let rectRight = iBaseObject.x + iBaseObject.width;
        let rectTop = iBaseObject.y;
        let rectBottom = iBaseObject.y + iBaseObject.height;

        // Circle properties
        let circleCenterX = circle.x + circle.width / 2;
        let circleCenterY = circle.y + circle.height / 2;
        let circleRadius = circle.width / 2; // Assuming circle.width = circle.height

        // Find closest point on rectangle to circle center
        let closestX = Math.max(rectLeft, Math.min(circleCenterX, rectRight));
        let closestY = Math.max(rectTop, Math.min(circleCenterY, rectBottom));

        // Calculate distance between closest point and circle center
        let distanceX = circleCenterX - closestX;
        let distanceY = circleCenterY - closestY;
        let distance = Math.sqrt(distanceX * distanceX + distanceY * distanceY);

        // Collision occurs if distance is less than circle radius
        return distance <= circleRadius;
    }

}
