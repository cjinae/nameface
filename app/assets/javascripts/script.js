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

//remove guess background on click of names
// animate on click of names
$('.thumbnail .imgcontainer').click(function(){
	console.log(this)
	$(this).siblings('.namespacer').find('.namelist').slideToggle(300);
	// $(this).find('.overlay').css('visibility','hidden');
});

$('.wrongname').click(function(evt) {
  // console.log($(this).text());
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

function wrongAnswer(){
	$(this).text( "hoo?")
};

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

function rightAnswer(){
	//stops action from going one level up
	// e.stopPropagation();  
	var x = $(this)
	x.css('color','#53777a');
	x.siblings('.wrongname').remove();
	flip(this);
};

//flip action
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
		// '<div>Animation complete.</div>'
		
		// this.src = '/assets/owl.png';
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


var num = parseInt($.trim($('.points').html()));
$('.realname').one('click', function(){
	$('.points').html(num+=2	)
});

$('.wrongname').one('click', function(){
	$('.points').html(num-=1)
});

























//end
});

