(function($){
  $(function(){

    $('.button-collapse').sideNav();

  }); // end of document ready
})(jQuery); // end of jQuery name space

$(document).ready(function() {
  $('.modal-trigger').leanModal(
      {
        complete: function() { location.reload() } // Callback for Modal close
      }
  );
});

$(document).ready(function() {
  $('select').material_select();
});