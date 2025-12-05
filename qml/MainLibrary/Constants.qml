import QtQuick 2.0

Item {

    property bool magnetPickedUp: false
    property bool stringPickedUp: false
    property bool magnetHookPickedUp: false

    property bool closetAngelOpened: false
    property bool diaryAngelPickedUp: false
    property bool closetMilanOpened: false
    property bool diaryMilanPickedUp: false

    property bool hairDryerPickedUp: false
    property bool extensionCablePickedUp: false

    property bool safeGearPickedUp: false

    property bool redKeyPickedUp: false
    property bool blueKeyPickedUp: false
    property bool greenKeyPickedUp: false

    property bool murderVideoPickedUp: false
    property bool blackMailVideoPickedUp: false


    property bool gotVideosFromCosta: true
    property bool videoMissing: false
    property bool milanBlackmailSeen: false
    property bool heartLostTheKeys: false
    property bool candeeDropedTheKey: false


    property var mUseEnum: {
        "NOTHING": 00,
        "MAGNETHOOK": 10,
        "BLUE_KEY": 11,
        "GREEN_KEY": 12,
        "RED_KEY": 13,
        "GEAR": 14,
        "ANGEL_DIARY": 15,
        "HAIR_DRYER": 16,
        "EXTENSION_CABLE": 17,
        "MAGNET": 18,
        "STRING": 19,

        "VIDEO_OF_MURDER": 20,
        "RETIREMENT_PLAN": 21,
        "RAUL_AMY": 22,
        "CANDEE_AMY": 23,
        "MILAN_BLACKMAIL": 24,

        "ICE": 30,
        "MAIN_SAFE": 31,
        "SIDE_SAFE": 32,
        "CD_PLAYER_SMALL": 33,
        "CD_PLAYER_BIG": 34,
        "MILAN": 35,
        "HEART": 36,
        "ANGEL": 37,
        "CANDEE": 38,
        "MAGNETHOOK_PUZZLE": 39
    }

    property var pMatchWith: {
        10: 39,
        11: 31,
        12: 31,
        13: 31,
        14: 32,
        15: 37,
        16: 17,
        17: 16,
        18: 19,
        19: 18,
        20: 34,
        21: 34,
        22: 34,
        23: 33,
        24: 33




    }
}
