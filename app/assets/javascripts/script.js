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


// animate on hover of face
$(function(){
	$('img.faceis').each(function(){
		var x = $(this);

		var target = x.css('background-image')
			// remove the right and left braces, g to continue finiding and replace with ''
			.replace(/^url|[\)\()]/g, '');
			console.log(target);

		x.wrap('<span style = "position: relative;"></span>')
			.parent() //span elements
			.prepend('<img class = "overlay">')
			.find('img:first') // selector is now new blank image
			.attr('src', target)

		x.css({
			'position' : 'absolute',
			'left' : 0,
		});

		x.hover(function(){
			x.stop().animate({
				opacity: 0.4 
			}, 250);
		}, function(){
			x.stop().animate({
			 	opacity:1	
			}, 250);
		});
	});
});

// remove guess background on click of names
// animate on click of names
$('.thumbnail .imgcontainer').click(function(){
	console.log(this)
	$(this).siblings('.namespacer').find('.namelist').slideToggle(300);
	$(this).find('.overlay').css('visibility','hidden');
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
	$(".nameis").stop().css({
		width:'0px',
		height:''+height+'px',
		marginLeft:''+margin+'px',
		opacity:'0.5'
	});
	$(name).closest('div').parent('.namespacer').siblings('.imgcontainer').find('.faceis').animate({
		width:'0px',
		height:''+height+'px',
		marginLeft:''+margin+'px',
		opacity:'0.5'
	}, 500, function (){
		$(this).removeClass('desaturate')
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

// select cardview count
// $("select").change(function () {
  // var str = "";
  // $("select option:selected").each(function () {
            // find form 
            // .submit
            // str += $(this).text() + " ";
  // });
  // $("div").text(str);
// })
// .change();




























//end
});

