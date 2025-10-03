import Felgo 4.0
import QtQuick 2.0

Item {
    id: sceneBase

    visible: false

    function getUpdatedFallspeed(fallSpeed) {
        if (fallSpeed < mConstants.maxFallSpeed) {
            return fallSpeed + mConstants.gravityStrength * mConstants.dt
        }
        return fallSpeed
    }
}
