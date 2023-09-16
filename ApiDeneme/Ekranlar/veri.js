.pragma library
var Anaurl = "http://localhost:3030"
var vale={}
var cars={}
var carUrl = "http://localhost:3030/cars"
function getCarAct(callback){
    var xhr = new XMLHttpRequest
    var data ;
    xhr.onreadystatechange = function(){
        if(xhr.readyState === XMLHttpRequest.DONE){
            var jsonData = xhr.responseText;
            data = JSON.parse(jsonData)
            console.log("Arac aksiyonu fonkisonu çalışıyor")
            callback(data["carsAct"]);
        }
    }
    xhr.open("GET" ,Anaurl);
    xhr.send();
}
function getCars(callback){
    var xhr = new XMLHttpRequest
    var data;
    xhr.onreadystatechange = function(){
        if(xhr.readyState === XMLHttpRequest.DONE){
            var jsonData = xhr.responseText;
            data = JSON.parse(jsonData)
            cars = data
            callback(data["cars"]);

        }
    }
    xhr.open("GET",carUrl);
    xhr.send();
}
function searchCars (callback,search){
    var xhr = new XMLHttpRequest
    var data;
    xhr.onreadystatechange = function(){
        if(xhr.readyState === XMLHttpRequest.DONE){
            var jsonData = xhr.responseText;
            data = JSON.parse(jsonData)
            cars = data

            callback(data["cars"])
        }
    }
    var url = Anaurl+search;
    xhr.open("GET",url)
    xhr.send();
}
function getVale(callback){
    var xhr = new XMLHttpRequest
    var data;
    xhr.onreadystatechange = function(){
        if(xhr.readyState === XMLHttpRequest.DONE){
            var jsonData = xhr.responseText;
            console.log(jsonData)
            data = JSON.parse(jsonData)
            vale = data


            callback(data["valeler"]);
        }

    }
    xhr.open("GET",Anaurl)
    xhr.send();
}
function addCar(plaka,model,numberGsm,alanVale,verenVale,id,carsActID,callback){
    var xhr = new XMLHttpRequest
    console.log(plaka,model,numberGsm,carsActID,alanVale,verenVale)
    //var lastCar = cars[cars.length - 1];
    //var lastId = lastCar.id+1
    var data= {

        "id":id,
        "plaka" : plaka,
        "model" : model,
        "carsActID" :carsActID,
        "numberGsm":numberGsm,
        "alanVale":alanVale,      
        "verenVale":verenVale,



    };
    xhr.open("POST",Anaurl+ "/cars");
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");


    xhr.onreadystatechange = function(){
        if(xhr.readyState === XMLHttpRequest.DONE){
            callback(data);
        }
    };
    xhr.send(JSON.stringify(data));
    console.log(data)
}
