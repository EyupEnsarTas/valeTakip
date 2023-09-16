import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import "veri.js" as Api

Rectangle{
    id: c_ekran
    anchors.fill: parent
    color:"gray"
    border.width: 3
    border.color: "gray"


    EklemeEkrani{
        id:ekle

    }
    AyrintiEkrani{
        id:ayrinti
    }
    property var lastElement : Api.cars[Array.length - 1];
    property int selectedIndex: -1

    function getC(){
        Api.getCars(function(data){
            lstmodel.clear();
            for (let i = 0; i < data.length; i++) {
                lstmodel.append(data[i])
                console.log(data[i].id)

            }

        })
    }
    Component.onCompleted: {
        getC()
    }

    Rectangle{
        id:ustEkran
        height: c_ekran.height*1/15
        width: c_ekran.width
        color:"gray"
        anchors.top: c_ekran.top




        Image {
            id: plus
            source: "../Image/plus.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            MouseArea{
                anchors.fill: parent
                onClicked: {
                       ekle.open();
                    c_ekran.getC("start")
                }
            }
        }



        Image {
            id: refresh
            source: "../Image/refresh2.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            width: plus.width
            height: plus.height
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    c_ekran.getC("start")
                    console.log("refresh komutu calistirildi")


                }
            }
        }







    }
    Rectangle{
        id:altEkran
        height: c_ekran.height*14/15
        width: c_ekran.width
        color:"white"
        border.width: 3
        border.color: "gray"
        anchors.bottom: c_ekran.bottom
        radius: 15
        Rectangle{
            clip:true
            focus:true
            id:v_info
            color: "white"
            anchors.centerIn: altEkran
            height: altEkran.height*0.989
            width: altEkran.width *0.97
            border.width: 2
            border.color:"black"
            radius: 15

            Rectangle{
                id:a
                clip:true
                focus:true
                height: v_info.height*0.99
                width: v_info.width *0.99
                anchors.centerIn: parent
                radius:30


                ListView{
                    id:listView
                    model:lstmodel
                    anchors.fill: parent

                    delegate: PaddedRectangle{
                        id:metinler
                        color:"lightgray"
                        border.width: 10
                        border.color:"white"

                        //anchors.horizontalCenter: parent.horizontalCenter
                        implicitWidth: a.width*0.99
                        implicitHeight: a.height*0.1
                        radius: 20
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                console.log("aga bu kod çalışıyo mu : " + Api.cars.id)
                            }
                        }

                        Row{
                            spacing:40
                            anchors.centerIn: metinler
                          // Label{

                          //     text:carsActID
                          //     font.pixelSize: 10
                          //     color: "black"

                          // }
                            Label{

                                text:plaka
                                font.pixelSize: 10
                                color: Api.cars.cars[index].carsActID === 1 ? "green" : "red"

                            }
                            Label{

                                text:model
                                font.pixelSize: 10
                                color: "black"
                            }
                            Label{

                                text:numberGsm
                                font.pixelSize: 10
                                color: "black"
                            }
                            Label{

                                text:Api.cars.cars[index].carsActID === 1 ? "içerde" : "dışarda"
                                font.pixelSize: 10
                                color: Api.cars.cars[index].carsActID === 1 ? "green" : "red"
                            }
                            Button{
                                text:"ayrıntı"
                                onClicked: {
                                    console.log("onClicked calisiyo")
                                    ayrinti.index1 =index
                                    //ayrinti.cars = lstmodel.get(index);
                                    ayrinti.open();

                                }

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


    function showDetailsPage(car) {
        var component = Qt.createComponent("Details.qml");
        if (component.status === Component.Ready) {
            var detailsPage = component.createObject(null);
            detailsPage.car = car;
            detailsPage.open();
        } else {
            component.statusChanged.connect(function() {
                if (component.status === Component.Ready) {
                    var detailsPage = component.createObject(null);
                    detailsPage.car = car;
                    detailsPage.open();
                }
            });
        }
    }


}

