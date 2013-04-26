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

$(function(){
	$('[rel=tooltip]').tooltip();
});

//remove guess background on click of names
// animate on click of names
$('.thumbnail .imgcontainer').click(function(){
	console.log(this)
	$(this).siblings('.namespacer').find('.namelist').slideToggle(300);
	// $(this).find('.overlay').css('visibility','hidden');
});

$('.wrongname').click(function(e) {
  console.log($(this).text());
  $(this).text( "hoo?")
});

$('.realname').click(function(e) {
	console.log($(this).text());
	e.stopPropagation();  //stops action from going one level up
	var x = $(this)
	x.css('color','#53777a');
	x.siblings('.wrongname').remove();
	flip(this);
});

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


























//end
});

