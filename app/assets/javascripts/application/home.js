$(document).ready(function(){
  new flickerplate('.flicker-example');

  $('#tabs').tabulous({
    effect: 'slideLeft'
  });

  $('#tabs2').tabulous({
    effect: 'slideLeft'
  });

  $('#tabs3').tabulous({
    effect: 'scaleUp'
  });

  $('#tabs4').tabulous({
    effect: 'flip'
  });

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
});
