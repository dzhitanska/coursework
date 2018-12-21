$(document).on("click", function(e) {
  if (e.target.id != 'dropdown' && e.target.id != 'dropdown-child' && e.target.id != 'mainmenubtn') {
    $("#dropdown-child").hide();
  } else if (e.target.id != 'dropdown-child') {
    $("#dropdown-child").toggle();
  }
});