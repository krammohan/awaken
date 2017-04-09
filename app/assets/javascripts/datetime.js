$(document).ready(function() {
  $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  })

  function value_() {
  var checkbox = document.getElementById('mycheckbox');
  alert('checkbox value: ' + checkbox.checked);
  }


})
