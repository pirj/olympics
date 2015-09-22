(function(){
  var initialize = function(){
    new flickerplate('.flicker-example');

    // $('#tabs').tabulous({
    //   effect: 'slideLeft'
    // });

    $('.owl-carousel').owlCarousel({
      loop:true,
      margin:10,
      nav:true,
      autoplay:true,
      autoplayTimeout:5000,
      responsive:{

        1000:{
          items:4
        }
      }
    });
  };
  $(document).ready(initialize);
  $(document).on('page:load', initialize);
})();
