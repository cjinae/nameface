$(document).ready(function(){

// $.ajax({
//   	url: "http://localhost:3000",
//   	dataType: 'json',
//   	context: document.body,
//   	error: function(){
//   		alert("json error");
//   	},
// 	success: function(data){
// 		console.log(data);
// 	}
//  });

$(function tooltip(){
	$('[rel=tooltip]').tooltip();
});

// Show name choices on click of face
$('.thumbnail .imgcontainer').click(function(){
	console.log(this)
	$(this).siblings('.namespacer').find('.namelist').slideToggle(300);
});

// Deduct points on wrong answer
$('.wrongname').click(function(evt) {
  wrongAnswer.call(this);
  $('.pointMinus').css({
			top: evt.pageY+10,
			bottom: evt.pageY+5,
			right: evt.pageX+5,
			left: evt.pageX+10
		}).fadeIn('slow',function(){
			$(this).fadeOut('slow');
		});	
});

// Animate on wrong answers
function wrongAnswer(){
	$(this).css('text-decoration','line-through')	
};

// Add points on right answer
$('.realname').one('click', function(evt) {
	rightAnswer.call(this);
	$('.pointPlus').css({
			top: evt.pageY+10,
			bottom: evt.pageY+5,
			right: evt.pageX+5,
			left: evt.pageX+10
		}).fadeIn('slow',function(){
			$(this).fadeOut('slow');
		});	
});

// Animate faces on right answer
function rightAnswer(){
	var x = $(this)
	x.css('color','#3DA9A4');
	x.siblings('.wrongname').remove();
	flip(this);
};

// the flip action
var margin =$(".faceis").width()/2;
var width =$(".faceis").width();
var height =$(".faceis").height();

function flip(name) {
	$(name).closest('div').parent('.namespacer').siblings('.imgcontainer').find('.border').animate({
		width:'0px',
		height:''+height+'px',
		marginLeft:''+margin+'px',
		opacity:'0.5'
	}, 500, function (){
		$(this).find('.faceis').removeClass('desaturate')
		//animate complete
		console.log('animate complete')
		$(this).stop().animate({
			width:''+width+'px',
			height:''+height+'px',
			marginLeft:'0',
			opacity:'1'
		}, 500, function() {
		});
	});
}

// Points counter:
var num = parseInt($.trim($('.points').html()));
$('.realname').one('click', function(){
	$('.points').html(num+=2)
});

$('.wrongname').one('click', function(){
	$('.points').html(num-=1)
});

























//end
});

