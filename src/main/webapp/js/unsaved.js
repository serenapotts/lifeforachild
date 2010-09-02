function unloadMess(){
    mess = "You haven't saved yet!"
    return mess;
}

function setBunload(on){
    window.onbeforeunload = (on) ? unloadMess : null;
}

setBunload(true);