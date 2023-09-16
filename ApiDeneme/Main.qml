import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls

ApplicationWindow {
    width: 1200
    height: 720
    visible: true
    title: qsTr("")





    SplitView {
        anchors.fill: parent
        orientation: Qt.Horizontal


        Rectangle {         
            id:valeAlani
            implicitWidth: parent.width *0.25
            anchors.left: parent.left
            SplitView.minimumWidth: parent.width *0.25
            SplitView.maximumWidth: parent.width *0.35
            color: "red"

            ValeEkrani{
                id:v_ekrani
            }


        }
        Rectangle {


            ArabaEkrani{
                id:c_ekrani
            }
            id: aracAlani
            SplitView.minimumWidth: 50
            SplitView.fillWidth: true
            color: "lightgray"

        }

    }
}
