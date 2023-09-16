import QtQuick
import QtQuick.Window
import QtQuick.Controls
import Qt.labs.qmlmodels
import "veri.js" as Api

Popup{

    id:ekle
    parent: Overlay.overlay
    anchors.centerIn: Overlay.overlay
    width: 250
    height: 300
    modal: true
    focus: true
    padding: 20

    property int cid: 0
    property int carsActivity: 1
    property string verenVale:" "

    // burda aracın son id değerinin gelmesi için fonksiyon çalışıyor
    Component.onCompleted: {
        getLastCarId();


    }

    function getLastCarId() {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var responseData = JSON.parse(xhr.responseText);
                    if (responseData.cars && responseData.cars.length > 0) {
                        var lastCar = responseData.cars[responseData.cars.length - 1];
                        var lastId = lastCar.id+1;
                        label.text =  lastId;
                        console.log("son id:"+lastId)
                        console.log("Son aracın ID'si:", lastCar.id);
                        cid = lastId;

                         //console.log("aga bu ne:"+lastIdvalue)
                    } else {
                        console.log("Araç bulunamadı.");
                    }
                } else {
                    console.error("API yanıtı alınamadı: " + xhr.status);
                }
            }
            return lastId;
        };
        xhr.open("GET", "http://localhost:3030/cars");
        xhr.send();

    }


  //  var lastCar = cars[cars.length - 1];
   // console.log("Last Car ID:", lastCar);

    Button{
        height: parent.height*1/14
        width: parent.width*1/14
        anchors.top: parent.top
        font.family: "Times New Roman"
        anchors.right: parent.right


        text:"X"
        onClicked: {
            ekle.getLastCarId("start");
            close();

        }

    }
    Rectangle{
        anchors.horizontalCenter: ekle


        Column{
            id:txtMetin
            spacing: 14

            Label{
                text: ("Plaka:")
                font.pixelSize: 17

            }
            Label{
                text: ("model:")
                font.pixelSize: 17


            }
            Label{
                text: ("Number")
                font.pixelSize: 17


            }
            Label{
                text: ("alVale:")
                font.pixelSize: 17


            }
            Label{
                text: ("id:")
                font.pixelSize: 17


            }



        }
        Column{
            anchors.left: txtMetin.right
            anchors.leftMargin: 10
            spacing: 10

            TextField {
                id:plaka
                placeholderText: "Plaka"
            }
            TextField {
                id:model
                placeholderText: "Model"
            }
            TextField {
                id:numberGsm
                placeholderText: "number"
            }
            TextField {
                id:alanVale
                placeholderText: "vale"
            }
            Label{
                id: label
                color:"black"
                font.pixelSize: 17
            }



        }
    }
    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        text: "Kaydet"
        onClicked:{
            ekle.getLastCarId("start");
            Api.addCar(plaka.text,model.text,numberGsm.text,alanVale.text,verenVale,cid,carsActivity,function(data){})
            ekle.getLastCarId("start");
            close();
        }
    }



}


