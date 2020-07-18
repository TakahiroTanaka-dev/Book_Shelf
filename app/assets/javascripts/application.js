//= require jquery
//= require rails-ujs
//= require_tree .

$(function(){
  $(".Header__logo").hover(function(){
    $(this).animate({opacity: 0.6}, {duration: 100, easing: 'swing'})
  }, function(){
    $(this).animate({opacity: 1})
  })
});