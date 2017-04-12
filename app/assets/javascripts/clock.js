function startTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var ampm;
    m = checkTime(m);
    ampm = get_ampm(h);
    h = twelvehour(h);
    
    document.getElementById('time').innerHTML = h + ":" + m + " " + ampm;
    var t = setTimeout(startTime, 2000); //every 2 seconds
}

function checkTime(i) {
    if (i < 10) {
        i = "0" + i};  // add zero in front of numbers < 10
    return i;
}

function twelvehour(h) {
   if (h>12){
        h = h-"12"};
   if (h==0){
        h="12"};
   return h;
}

function get_ampm(h){
   var t
   if (h<12){
        t = "AM"};
   if (h>12){
       t = "PM"};
   return t;
}


