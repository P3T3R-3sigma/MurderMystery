import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    width: 800
    height: 600

    // Physics constants
    property real gravity: 9.81 * 100 // Gravity: 9.81 m/s^2, scaled to pixels (100 pixels = 1 meter)
    property real deltaTime: 1/60 // ~60 FPS (16ms per frame)
    property real magneticStrength: 5000 // Adjust for realistic attraction
    property real stringLength: 300 // String length in pixels (1 meter)
    property vector2d pivotPoint: Qt.vector2d(1900, 50) // Pivot at top center

    // Magnet properties
    Rectangle {
        id: magnet
        x: position.x
        y: position.y
        width: 20
        height: 20
        radius: 10
        property vector2d velocity: Qt.vector2d(0, 0)
        property vector2d position: Qt.vector2d(pivotPoint.x - 10, pivotPoint.y + stringLength - 10)
        property real mass: 0.1 // Magnet weight: 0.1 kg
        property bool isMagnet: true
    }
    function update() {
        magnet.velocity += Qt.vector2d(gravity*Math.sin(rotation/180*Math.PI)*Math.sin(rotation/180*Math.PI)) * deltaTime
        let oldPos = magnet.position
        magnet.position += magnet.velocity * deltaTime

        stringLine.rotation = Math.atan((oldPos.x - magnet.position.x)/(magnet.position.y - oldPos.y))
    }

    // String visualization
    Rectangle {
        id: stringLine
        x: pivotPoint.x - stringLength/2*Math.sin(rotation/180*Math.PI)
        y: pivotPoint.y
        width: 2
        height: stringLength
        color: "yellow"

        rotation: 10
    }

    // // Key (metallic, attracted to magnet)
    // Item {
    //     id: key
    //     x: 200
    //     y: root.height - 40
    //     width: 15
    //     height: 10
    //     property vector2d velocity: Qt.vector2d(0, 0)
    //     property real mass: 0.05 // Key weight: 0.05 kg
    //     property bool isMetallic: true
    //     Rectangle {
    //         anchors.fill: parent
    //         color: "gold"
    //     }
    // }

    // // Trash items (some metallic, some not)
    // Repeater {
    //     id: trashRepeater
    //     model: [
    //         { x: 300, y: root.height - 40, isMetallic: true, mass: 0.02, type: "Nail" }, // Metallic
    //         { x: 350, y: root.height - 40, isMetallic: true, mass: 0.03, type: "Screw" }, // Metallic
    //         { x: 400, y: root.height - 40, isMetallic: false, mass: 0.01, type: "Plastic" } // Non-metallic
    //     ]
    //     Item {
    //         x: modelData.x
    //         y: modelData.y
    //         width: modelData.isMetallic ? 10 : 15
    //         height: modelData.isMetallic ? 10 : 15
    //         property vector2d velocity: Qt.vector2d(0, 0)
    //         property bool isMetallic: modelData.isMetallic
    //         property real mass: modelData.mass
    //         property string type: modelData.type
    //         Rectangle {
    //             anchors.fill: parent
    //             color: modelData.isMetallic ? "silver" : "gray"
    //             radius: modelData.isMetallic ? width / 2 : 0
    //         }
    //     }
    // }

    // // Ground (visual boundary)
    // Rectangle {
    //     id: ground
    //     y: root.height - 20
    //     width: root.width
    //     height: 20
    //     color: "brown"
    // }

    // // Physics update timer
    // Timer {
    //     id: physicsTimer
    //     interval: 16 // ~60 FPS
    //     running: true
    //     repeat: true
    //     onTriggered: {
    //         // Update magnet (string constraint and inertia)
    //         let mx = magnet.x + magnet.width / 2
    //         let my = magnet.y + magnet.height / 2
    //         let dx = mx - pivotPoint.x
    //         let dy = my - pivotPoint.y
    //         let distance = Math.sqrt(dx * dx + dy * dy)
    //         if (distance > stringLength) {
    //             // Constrain magnet to string length
    //             let angle = Math.atan2(dy, dx)
    //             magnet.x = pivotPoint.x + stringLength * Math.cos(angle) - magnet.width / 2
    //             magnet.y = pivotPoint.y + stringLength * Math.sin(angle) - magnet.height / 2
    //             // Adjust velocity to maintain tangential motion (inertia)
    //             let radialVelocity = (magnet.velocity.x * dx + magnet.velocity.y * dy) / distance
    //             magnet.velocity = Qt.vector2d(
    //                 magnet.velocity.x - radialVelocity * dx / distance,
    //                 magnet.velocity.y - radialVelocity * dy / distance
    //             )
    //         }
    //         // Apply gravity to magnet
    //         magnet.velocity.y += gravity * deltaTime / magnet.mass
    //         magnet.x += magnet.velocity.x * deltaTime
    //         magnet.y += magnet.velocity.y * deltaTime

    //         // Update key and trash
    //         let objects = [key].concat(trashRepeater.model.map((_, i) => trashRepeater.itemAt(i)))
    //         for (let obj of objects) {
    //             // Apply gravity
    //             obj.velocity.y += gravity * deltaTime / obj.mass
    //             obj.x += obj.velocity.x * deltaTime
    //             obj.y += obj.velocity.y * deltaTime

    //             // Apply magnetic force (if metallic)
    //             if (obj.isMetallic) {
    //                 let dx = magnet.x + magnet.width / 2 - (obj.x + obj.width / 2)
    //                 let dy = magnet.y + magnet.height / 2 - (obj.y + obj.height / 2)
    //                 let distance = Math.sqrt(dx * dx + dy * dy)
    //                 if (distance < 200 && distance > 0) { // Magnetic range: 2 meters
    //                     let force = magneticStrength / (distance * distance) // Inverse-square law
    //                     let angle = Math.atan2(dy, dx)
    //                     let forceVector = Qt.vector2d(force * Math.cos(angle), force * Math.sin(angle))
    //                     obj.velocity.x += forceVector.x * deltaTime / obj.mass
    //                     obj.velocity.y += forceVector.y * deltaTime / obj.mass
    //                 }
    //             }

    //             // Ground collision
    //             if (obj.y + obj.height > ground.y) {
    //                 obj.y = ground.y - obj.height
    //                 obj.velocity.y = -0.3 * obj.velocity.y // Simple bounce with damping
    //                 obj.velocity.x *= 0.8 // Friction-like damping
    //             }
    //         }
    //     }
    // }

    // // Mouse control to move magnet
    // MouseArea {
    //     anchors.fill: parent
    //     onPositionChanged: {
    //         let dx = mouseX - (magnet.x + magnet.width / 2)
    //         let dy = mouseY - (magnet.y + magnet.height / 2)
    //         magnet.velocity.x += dx * 0.5 * deltaTime / magnet.mass
    //         magnet.velocity.y += dy * 0.5 * deltaTime / magnet.mass
    //     }
    // }

    // // Debug info
    // Text {
    //     anchors.top: parent.top
    //     anchors.left: parent.left
    //     text: "Drag to swing magnet. Attract key and metallic trash."
    //     color: "black"
    // }
}
