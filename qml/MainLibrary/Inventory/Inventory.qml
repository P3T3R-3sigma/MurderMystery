import QtQuick
import Felgo

import "../Interact"

Item {
    id: iInventory
    anchors.fill: parent

    property var pInventory: []

    function addToInventory(item) {
        pInventory.push(item)
        pInventory = pInventory
    }

    Rectangle {
        id: iClosedInventory
        x: parent.width * 0.85
        y: parent.height * 0.85
        width: parent.width * 0.1
        height: parent.height * 0.1
        color: "#824F28"

        visible: true

        Text {
            anchors.centerIn: parent
            text: "Inventory"
            font.pixelSize: 40
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                iInspect.visible = false
                iOpenInventory.visible = !iOpenInventory.visible
            }
        }
    }
    Rectangle {
        id: iOpenInventory
        x: (parent.width-width)/2
        y: (parent.height-height)/2
        width: parent.width * 0.6
        height: parent.width * (0.1+0.02)*3
        color: "#824F28"

        visible: false

        Flow {
            x: iInventory.width * 0.01
            y: iInventory.width * 0.01
            width: parent.width * 1
            height: parent.height * 1
            spacing: iInventory.width * 0.02
            Repeater {
                model: 15

                Rectangle {
                    width: iInventory.width * 0.1
                    height: width
                    color: "#613413"
                    AppImage {
                        anchors.fill: parent
                        source: pInventory.length > index ? "../../../assets/Images/" + pInventory[index].pSource : ""
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (pInventory.length > index) {
                                inspect(index)
                            }
                        }
                    }
                }
            }
        }
    }

    Rectangle {
        id: iInspect
        x: (parent.width-width)/2
        y: (parent.height-height)/2
        width: parent.width * 0.8
        height: parent.height * 0.8
        color: "#824F28"

        visible: false

        Rectangle {
            x: parent.width * 0.1
            y: parent.height * 0.2
            width: parent.width * 0.3
            height: parent.height * 0.6
            color: "#613413"
            Rectangle {
                anchors.centerIn: parent
                width: parent.width * 0.4
                height: width
                color: "#613413"
                AppImage {
                    id: iInspectSource
                    anchors.fill: parent
                    source: pSource ? "../../../assets/Images/" + pSource : ""
                }
            }
        }
        Rectangle {
            x: parent.width * 0.5
            y: parent.height * 0.1
            width: parent.width * 0.4
            height: parent.height * 0.6
            color: "#613413"
            Rectangle {
                x: parent.width * 0.1
                y: parent.height * 0.4
                width: parent.width * 0.8
                height: parent.height * 0.5
                color: "#824F28"
                Text {
                    id: iInspectDescription
                    anchors.centerIn: parent
                    text: ""
                    font.pixelSize: 24
                }
            }
            Rectangle {
                x: parent.width * 0.1
                y: parent.height * 0.1
                width: parent.width * 0.8
                height: parent.height * 0.2
                color: "#824F28"
                Text {
                    anchors.centerIn: parent
                    text: "Description"
                    font.pixelSize: 40
                }
            }
        }
        Rectangle {
            x: parent.width * 0.6
            y: parent.height * 0.8
            width: parent.width * 0.2
            height: parent.height * 0.1
            color: "#613413"
            Text {
                anchors.centerIn: parent
                text: "Use"
                font.pixelSize: 40
            }
        }
    }


    function inspect(index) {
        iInspect.visible = true
        iInspectSource.source = "../../../assets/Images/" + pInventory[index].pSource
        iInspectDescription.text = pInventory[index].pDescription
    }
}
