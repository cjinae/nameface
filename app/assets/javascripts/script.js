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
	console.log('clicked')
	$('h4').fadeIn(500)
})


$('#0 .realname').click(function(){
	console.log('baldsf')
})


})

