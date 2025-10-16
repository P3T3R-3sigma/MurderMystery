import Felgo 4.0
import QtQuick 2.0

Item {
    id: iGrid

    property var pListplaces: []

    anchors.fill: parent

    Column {
        spacing: iGrid.width *0.05 - iGrid.width*0.002 - iGrid.width * 1/80
        x: parent.width * 0.2
        y: parent.height * 0.25
        Repeater {
            model: 6
            Row {
                spacing: iGrid.width * 0.05 - iGrid.width*0.002 - iGrid.width * 1/80
                Repeater {
                    model: 9
                    Rectangle {
                        id: placement
                        width: iGrid.width * 1/80
                        height: width
                        radius: width/2
                        color: "gray"
                        Component.onCompleted: {
                            Qt.callLater(function() {
                                var coords = placement.mapToItem(iGrid, 0, 0)
                                pListplaces.push({ element: placement, x: coords.x+radius, y: coords.y+radius })
                            })
                        }
                    }
                }
            }
        }
    }

    function shouldSnap(baseX, baseY, mouseX, mouseY) {
        console.log(mouseX, mouseY)
        for (let i in pListplaces) {
            console.log(pListplaces[i].x, pListplaces[i].y)
            if (Math.sqrt(Math.pow((pListplaces[i].x - mouseX), 2) + Math.pow((pListplaces[i].y - mouseY), 2)) < pListplaces[i].element.radius) {
                return pListplaces[i]
            }
        }
        return {element: null, x: baseX, y: baseY}
    }
}
