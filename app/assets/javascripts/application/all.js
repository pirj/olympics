(function(){
  var initialize = function(){
    $('a[data-reveal-id]').on('click', function(e) {
      e.preventDefault();
      var modalLocation = $(this).attr('data-reveal-id');
      $('#'+modalLocation).reveal($(this).data());
    });
  };

  $(document).ready(initialize);
  $(document).on('page:load', initialize);
})();
