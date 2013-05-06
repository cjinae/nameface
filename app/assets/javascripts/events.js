// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(function(){
	
$('.action').hover(function(){
	$(this).toggleClass('dark');
});

$('.search-entry').focusin(function(){
	$('.search-header').removeClass('blinkon');
})

$('.search-entry').focusout(function(){
	$('.search-header').addClass('blinkon');
})

$(function() {
	$("*").on("ajax:success", function(e) {
		e.stopPropagation();
		$(this).closest('li').remove();
		console.log(this);
	});
});

})