import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import "veri.js" as Api


Popup{
    id:silme
    parent: Overlay.overlay
    anchors.centerIn: Overlay.overlay
    width: 600
    height: 600
    modal: true
    focus: true
    padding: 20


    property var car:

        Column {
            anchors.centerIn: parent
            spacing: 10

            Label {
                text: "ID: " + car.id
            }

            Label {
                text: "Plaka: " + car.plaka
            }

            Label {
                text: "Model: " + car.model
            }

            Label {
                text: "Number GSM: " + car.numberGsm
            }

            Button {
                text: "Kapat"
                onClicked: popup.close()
            }
        }




}
