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


//flip


var margin =$(".image1").width()/2;
var width=$(".image1").width();
var height=$(".image1").height();
$(".image2").stop().css({width:'0px',height:''+height+'px',marginLeft:''+margin+'px',opacity:'0.5'});
// $("#reflection2").stop().css({width:'0px',height:''+height+'px',marginLeft:''+margin+'px'});
	$(".image1").click(function(){
		$(this).stop().animate({
			width:'0px',
			height:''+height+'px',
			marginLeft:''+margin+'px',
			opacity:'0.5'
		}, 500, function (){
			//animate complete
			// '<div>Animation complete.</div>'
			this.src = '/assets/nameis.png';
			$(this).stop().animate({
				width:''+width+'px',
				height:''+height+'px',
				marginLeft:'0',
				opacity:'1'
			}, 500, function() {
				// unbind the click event from this
				$(this).unbind('click')
			});
		});
	});
	// 	window.setTimeout(function() {
	// 	$(".image2").stop().animate({width:''+width+'px',height:''+height+'px',marginLeft:'0px',opacity:'1'},{duration:500});
	// 	},500);
	// });
	// $(".image2").click(function(){
	// 	$(this).stop().animate({width:'0px',height:''+height+'px',marginLeft:''+margin+'px',opacity:'0.5'},{duration:500});
	// 	window.setTimeout(function() {
	// 	$(".image1").stop().animate({width:''+width+'px',height:''+height+'px',marginLeft:'0px',opacity:'1'},{duration:500});
	// 	},500);
	// });

});

