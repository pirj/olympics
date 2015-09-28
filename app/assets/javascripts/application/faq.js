(function(){
  var initialize = function(){
    $(".spoiler .block").show();
    $(".close .block").hide();
    $(".spoiler h2").click(function() {
      $(this).toggleClass("bgcolor").next().slideToggle("medium");
    });
  };
  $(document).ready(initialize);
  $(document).on('page:load', initialize);
})();
