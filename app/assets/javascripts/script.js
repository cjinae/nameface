$(document).ready(function(){

$.ajax({
  	url: "http://localhost:3000/users",
  	dataType: 'json',
  	context: document.body,
  	// error: function(){
  	// 	alert("json error");
  	// },
	success: function(data){
		console.log(data);
	}
  })

});
