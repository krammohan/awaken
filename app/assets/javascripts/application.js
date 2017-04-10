// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require skel.min
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require materialize-sprockets
//= require materialize_datepicker
//= require_tree .


// App.globals.name_of_user = <%= current_user.username %>

$(document).ready(function(){
	$('div.hidden').fadeIn(2500);
	generatePage();
})


var generatePage = function() {
	if (weather == true){
		weatherHandler();
	}
}



 var weatherHandler = function(){
        var api_key =  "9d3f2195def4857f73b59e548d2b7c4f";
    	$.getJSON("http://api.openweathermap.org/data/2.5/weather?zip="+ zip +",us&appid=" + api_key,function(result){

        var kelvin = result.main.temp;
        var fahrenheit = ((kelvin)*(9/5))-459.67;
        var fahrenheit_rounded = Math.round(fahrenheit*10)/10;

        var wind = Math.round((result.wind.speed/0.44704)*10)/10;

        var message = (result.name+"<br><h5>"+ fahrenheit_rounded + "°F<br>"+wind+" mph<br>"+result.weather[0].description+"</h5>");
        console.log(name)
        $('#weather').append(message);
        $('#weather-icon').attr("src", "http://openweathermap.org/img/w/"+result.weather[0].icon+".png");

        });

  };

  var distanceHandler = function(){
    var api_key = "AIzaSyAB-OQWl0TlKxC8cE00Cmn8nlhE2mN1BEg";

   $.getJSON("https://maps.googleapis.com/maps/api/distancematrix/json?origins=Vancouver+BC|Seattle&destinations=San+Francisco|Victoria+BC&key="+ api_key, function(result){
        console.log(result);
    })
  }
