import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import "veri.js" as Api


Popup{
    id:ayr
    parent: Overlay.overlay
    anchors.centerIn: Overlay.overlay
    width: 300
    height: 500
    modal: true
    focus: true
    padding: 2



    property int index1: 0
    property int secilen: index1
    //property var cars: ({})
    onOpened: {
        console.log("id:"+index1)
        console.log(Api.cars.cars[secilen].id + " aga bu id mi ")
        console.log(Api.cars.cars[secilen].model + " aga bu id mi ")

    }

    Rectangle{
        anchors.fill: parent
        Rectangle{
            anchors.centerIn: parent
            height: 200
            width: 200
            color:"orange"


        Column{
            id:sag


            spacing: 10

            Label{
                text: "id:"
                id: idDeger1
                color:"black"
                font.pixelSize: 17
            }
            Label{
                text: "model:"
                id: modelDeger1
                color:"black"
                font.pixelSize: 17
            }
            Label{
                text: "alan vale:"
                id: alanValeDeger1
                color:"black"
                font.pixelSize: 17
            }
            Label{
                text: "numara:"
                id: num1
                color:"black"
                font.pixelSize: 17
            }
            Label{
                text: "plaka:"
                id: plak1
                color:"black"
                font.pixelSize: 17
            }
        }
        Column{
            anchors.left: sag.right
            anchors.leftMargin: 10

            spacing: 10

            Label{
                text: Api.cars.cars[secilen].id
                id: idDeger
                color:"black"
                font.pixelSize: 17
            }
            Label{
                text: Api.cars.cars[secilen].model
                id: modelDeger
                color:"black"
                font.pixelSize: 17
            }
            Label{
                text: Api.cars.cars[secilen].alanVale
                id: alanValeDeger
                color:"black"
                font.pixelSize: 17
            }
            Label{
                text: Api.cars.cars[secilen].numberGsm
                id: num
                color:"black"
                font.pixelSize: 17
            }
            Label{
                text: Api.cars.cars[secilen].plaka
                id: plak
                color:"black"
                font.pixelSize: 17
            }
        }
        }
    }
}
