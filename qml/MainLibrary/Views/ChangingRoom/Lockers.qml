import QtQuick
import Felgo

import "../"
import "../../Controll"

BaseView {
    id: iLockers

    property bool pMilanOpen: false
    property bool pAmyOpen: false
    property bool pAngelOpen: false
    property bool pCandeeOpen: false

    pImageSource: "Lockers.png"
    pNextView: mChangingRoom


    NavigationRect {
        id: iMilanPadlock
        xPercent: 0.212
        yPercent: 0.53
        widthPercent: 0.04
        heightPercent: 0.06
        pEnabled: !pMilanOpen
        pSource: "Padlock.png"
        functionOnClicked: function() {pMilanOpen = true }
    }
    NavigationRect {
        id: iCandeePadlock
        xPercent: 0.373
        yPercent: 0.53
        widthPercent: 0.04
        heightPercent: 0.06
        pEnabled: !pCandeeOpen
        pSource: "Padlock.png"
        functionOnClicked: function() {pCandeeOpen = true }
    }
    NavigationRect {
        id: iAmyPadlock
        xPercent: 0.534
        yPercent: 0.53
        widthPercent: 0.04
        heightPercent: 0.06
        pEnabled: !pAmyOpen
        pSource: "Padlock.png"
        functionOnClicked: function() {pAmyOpen = true }
    }
    NavigationRect {
        id: iAngelPadlock
        xPercent: 0.691
        yPercent: 0.53
        widthPercent: 0.04
        heightPercent: 0.06
        pEnabled: !pAngelOpen
        pSource: "Padlock.png"
        functionOnClicked: function() {pAngelOpen = true }
    }

    NavigationRect {
        id: iMilanLocker
        xPercent: 0.212
        yPercent: 0.47
        widthPercent: 0.04
        heightPercent: 0.12
        pEnabled: pMilanOpen
        functionOnClicked: function() {iLockerMilan.startFadeIn() }
    }
    NavigationRect {
        id: iCandeeLocker
        xPercent: 0.373
        yPercent: 0.47
        widthPercent: 0.04
        heightPercent: 0.12
        pEnabled: pCandeeOpen
        functionOnClicked: function() {pCandeeOpen = true }
    }
    NavigationRect {
        id: iAmyLocker
        xPercent: 0.534
        yPercent: 0.47
        widthPercent: 0.04
        heightPercent: 0.12
        pEnabled: pAmyOpen
        functionOnClicked: function() {pAmyOpen = true }
    }
    NavigationRect {
        id: iAngelLocker
        xPercent: 0.691
        yPercent: 0.47
        widthPercent: 0.04
        heightPercent: 0.12
        pEnabled: pAngelOpen
        functionOnClicked: function() {pAngelOpen = true }
    }

    LockerMilan {
        id: iLockerMilan
    }



}


