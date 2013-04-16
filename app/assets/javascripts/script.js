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
 });

$('.thumbnail .imgcontainer').click(function(){
	// console.log('clicked');
	$(this).siblings('h4').slideToggle(300);
})

$('.wrongname').click(function(e) {
  console.log($(this).text());
  alert("Try Again!");
  $(this).remove();
});

$('.realname').click(function(e) {
	console.log($(this).text());
	e.stopPropagation();  //stops action from going one level up
	flip(this);
	// alert("Correct!");
});

//flip action

var margin =$(".image1").width()/2;
var width=$(".image1").width();
var height=$(".image1").height();

function flip(image) {
	$(".image2").stop().css({
		width:'0px',
		height:''+height+'px',
		marginLeft:''+margin+'px',
		opacity:'0.5'
	});
	$(image).siblings('.imgcontainer').find('.image1').animate({
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
			// $(this).unbind('click')
		});
	});
}






















//end
});

