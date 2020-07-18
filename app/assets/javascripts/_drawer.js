$(function(){
  $("li").hover(function(){
    $(this).animate({opacity: 0.6}, {duration: 100, easing: 'swing'})
  }, function(){
    $(this).animate({opacity: 1})
  })
});