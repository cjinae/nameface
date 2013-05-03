// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(function(){
	
$('.action').hover(function(){
	$(this).toggleClass('dark');
});

$(function() {
	$("*").on("ajax:success", function(e) {
		e.stopPropagation();
		$(this).html("w00t!");
		$(this).closest('li').remove();
		console.log(this);
	});
});

})