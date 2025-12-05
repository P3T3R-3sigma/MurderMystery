import Felgo
import QtQuick
import QtMultimedia


Item {
    id: baseLoader

    property string pAssetCode: parent.pAssetCode
    property var pLoadAsset: parent
    property var pListSources: []
    property string pExtractFrom

    Component.onCompleted: {
        extractNames(pExtractFrom, pAssetCode, function(names){pListSources = names})
        if (pListSources.length === 1) {
            pLoadAsset.source = "qrc:/" + pListSources[0]
        } else {
            setSource("Static")
        }
    }

    onPListSourcesChanged: {
        if (pListSources.length === 1) {
            pLoadAsset.source = "qrc:/" + pListSources[0]
        } else {
            setSource("Static")
        }
    }

    onPAssetCodeChanged: extractNames(pExtractFrom, pAssetCode, function(names){pListSources = names})


    function extractNames(folder, filter, callBack) {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", folder);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var qrcContent = xhr.responseText;
                    callBack(shadowExtractNames(qrcContent, filter))
                } else {
                    console.log("Failed to load qrc file:", xhr.status);
                }
            }
        };
        xhr.send();
    }
    function shadowExtractNames(qrcFile, filter) {
        if (filter === "") {
            return []
        }

        let names = []
        let split0 = qrcFile.split("<file>")
        let split1 = []
        let split2 = []
        for (let i in split0) {
            split1.push(...split0[i].split("</file>"))
        }
        for (let j in split1) {
            if (split1[j].includes(filter)) {
                names.push(split1[j])
            }
        }
        return names
    }

    function setSource(lStatus) {
        for (let i in pListSources) {
            if (pListSources[i].toString().includes(lStatus)) {
                pLoadAsset.source = "qrc:/" + pListSources[i]
                return
            }
            if (pListSources[i].toString().includes(lStatus.toUpperCase())) {
                pLoadAsset.source = "qrc:/" + pListSources[i]
                return
            }
        }
        pLoadAsset.source = ""
    }
}
