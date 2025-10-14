import Felgo 4.0
import QtQuick 2.0

Item {
    id: iPhysics

    anchors.fill: parent


    // Physics parameters
    property real l: 200.0  // length in pixels (scaled from 1m)
    property real g: 9810   // Gravity in px/s² (9.81 * 10 for pixel scaling)
    property real theta0: 0  // Initial angle in radians (30°)
    property real theta: theta0   // Current angle
    property real omega: 0.0      // Angular velocity dθ/dt
    property real dt: 1/120      // Timestep (60 FPS)
    property bool smallAngle: false  // Toggle for approximation
    property real v: 0.0          // linear speed for forces
    property real m: 0.1          // Mass (kg)

    // Computed forces (updated in script)
    property real tension: 0.0
    property real ftangential: 0.0

    // Pivot position
    property real pivotX: width / 2
    property real pivotY: 50

    // Blob position (derived from theta)
    property real blobX: pivotX + l * Math.sin(theta)
    property real blobY: pivotY + l * Math.cos(theta)

    // Energy-based v² = 2 g l (cos θ - cos θ0)  [note: scaled g and l]
    property real cosTheta0: Math.cos(theta0)

    property bool increaseLength: false
    property bool decreaseLength: false

    function reset() {
        stuck = false
        blob.color = "red"
        gotKey = false
        l = 200
        theta = theta0
        pivotX = width / 2
        pivotY = 50
        blobX = pivotX + l * Math.sin(theta)
        blobY = pivotY + l * Math.cos(theta)
        v = 0
    }

    function update() {
        if (increaseLength) {
            blobX = pivotX + (l+0.5) * Math.sin(theta) * 1.002
            blobY = pivotY + (l+0.5) * Math.cos(theta) * 1.002
        } else if (decreaseLength) {
            blobX = pivotX + (l-0.5) * Math.sin(theta) * 0.998
            blobY = pivotY + (l-0.5) * Math.cos(theta) * 0.998
        }

        updateForces()
        updateVelocity()
        updatePosition()
        updateAngles()
    }

    function updateForces() {
        // tension = m * g * Math.cos(theta) + m * (v * v) / l;
        ftangential = -m * g * Math.sin(theta);

    }

    function updateVelocity() {
        if (ftangential > 0) {
            v -= Math.sqrt(Math.abs(2 * ftangential*dt / m))
        } else {
            v += Math.sqrt(Math.abs(2 * ftangential*dt / m))
        }

    }

    function updatePosition() {
        if (blobX - v*Math.cos(theta) * dt < parent.width*0.7 && blobX - v*Math.cos(theta) * dt > parent.width*0.3) {
            blobX -= v*Math.cos(theta) * dt
            blobY += v*Math.sin(theta) * dt
        } else {
            v = 0
        }
    }

    function updateAngles() {
        theta = Math.atan((blobX-pivotX)/(blobY-pivotY))
        l = Math.sqrt(Math.pow(blobX-pivotX, 2) + Math.pow(blobY-pivotY, 2))
    }

}
