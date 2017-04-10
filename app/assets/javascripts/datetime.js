$(document).ready(function() {
  $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  })

  $("#switch-is-on").on("click", function(){
    var url = $(this).closest("form").attr("action") + "/weather"
    $.ajax({
      url: url,
      method: "PUT"
    })

  })

  function value_() {
  var checkbox = document.getElementById('mycheckbox');
  alert('checkbox value: ' + checkbox.checked);
  }


})