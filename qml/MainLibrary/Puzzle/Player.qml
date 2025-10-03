import QtQuick 2.0

import "../BaseEntity"
import "../Controll"

BaseEntity {
    id: iPlayer

    PlayerGraphic {
        id: iPlayerGraphic
    }
    PlayerControll{
        id: iPlayerControll
    }

    function functionsToCall() {
        jump()
        move()
    }

    function jump() {
        if (iPlayerControll.isJumping) {
            pFallSpeed = -mConstants.jumpSpeed
        }
    }
    function move() {
        pVertSpeed = 0
        if (iPlayerControll.isMovingLeft) {
            pVertSpeed -= 200
        }
        if (iPlayerControll.isMovingRight) {
            pVertSpeed += 200
        }
    }
}
