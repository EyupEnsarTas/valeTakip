import QtQuick
import QtQuick.Controls
import Qt.labs.qmlmodels
import "veri.js" as Api


Rectangle{
    id: v_ekran
    anchors.fill: parent
    color:"lightgray"
    border.width: 3;
    border.color:"gray"

    function getV(){
        Api.getVale(function(data){
            lstmodel.clear();
            for (let i = 0; i < data.length; i++) {
                lstmodel.append(data[i])
                console.log(data[i].age)
            }
        })
    }
    Component.onCompleted: {
        getV("start")
    }

    Column{
        anchors.horizontalCenter: parent.horizontalCenter
        spacing:10

        Text {
            id: bos
            text: qsTr(" ")
        }


        Text {
            id: info
            text: qsTr(" VALE ")
            anchors.horizontalCenter: parent.horizontalCenter
        }








        Rectangle{
            clip:true
            focus:true
            id:v_info
            color: "white"
            height: v_ekran.height*0.90
            width: v_ekran.width *0.90
            border.width: 2
            border.color:"black"
            radius: 15

            Rectangle{
                id:a
                clip:true
                focus:true
                height: v_info.height*0.98
                width: v_info.width *0.94
                anchors.centerIn: parent


                ListView{
                    id:listView
                    model:lstmodel
                    anchors.fill: parent

                    delegate: PaddedRectangle{
                        id:metinler
                        color:"lightgray"
                        border.width: 5
                        border.color: "white"
                        anchors.horizontalCenter: parent.horizontalCenter
                        implicitWidth: a.width*0.999999999999999999
                        implicitHeight: a.height*0.11
                        radius: 15
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                console.log(Api.cars["plaka"][index])
                            }
                        }

                        Row{
                            spacing:10
                            anchors.centerIn: metinler
                            Label{

                                text:model.name
                                font.pixelSize: 15
                                color: "black"

                            }
                            Label{

                                text:model.surname
                                font.pixelSize: 15
                                color: "black"
                            }
                            Label{

                                text:model.age
                                font.pixelSize: 15
                                color: "black"
                            }
                        }
                    }
                }


            }
            ListModel{
                id:lstmodel
            }


        }
    }



}
