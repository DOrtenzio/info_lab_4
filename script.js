"use strict"
let isOn=false;
let cont=0;

function useCont(){
    isOn=!isOn;
    let labelCont=document.getElementById("cont");
    let buttonCont=document.getElementById("button_cont");
    labelCont.innerText=cont; //Aggiorno la scritta

    if(isOn){
        buttonCont.innerText="Stop";
        while(isOn){
            setInterval(aggCont(labelCont),1000);
        }
    }else{
        buttonCont.innerText="Avvia";
    }
}

function azz(){
    cont=0;
}

function aggCont(labelCont){
    cont++;
    if(cont==10){ //Evento immagine e reset
        cont=0;
        //Immagine
        imgView(true);
        setTimeout(imgView(false),3000);
    } 
    labelCont.innerText=cont;
}

function imgView(isVisible){
    let divImg=document.getElementById("div_img");
    if(isVisible){
        divImg.visibility="visible";
    } else {
        divImg.visibility="hidden";
    }
}