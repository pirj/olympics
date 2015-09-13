$(document).ready(function(){
  $('.flicker-example').flicker();

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
