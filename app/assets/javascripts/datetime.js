$(document).ready(function() {
  $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  })

  $("#switch-is-on").on("click", function(){
    var url = $(this).data("data")
    console.log($(this))
    console.log(url)
  })

  function value_() {
  var checkbox = document.getElementById('mycheckbox');
  alert('checkbox value: ' + checkbox.checked);
  }


})
