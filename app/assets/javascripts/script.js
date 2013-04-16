$(document).ready(function(){

$.ajax({
  	url: "http://localhost:3000",
  	dataType: 'json',
  	context: document.body,
  	error: function(){
  		alert("json error");
  	},
	success: function(data){
		console.log(data);
	}
 })

$('.thumbnail img').click(function(){
	console.log('clicked');
	// $(this).children('h4').slideToggle(300);
	$(this).siblings('h4').slideToggle(300);

})

$('.realname').click(function(e) {
	console.log($(this).text());
	alert("Correct!");
	e.stopPropagation();  //stops action from going one level up
})

$('.wrongname').click(function(e) {
	console.log($(this).text());
	alert("Try Again!");
	$(this).remove();

})







})

