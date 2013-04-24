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
	$('img.faceis').each(function(){
		var x = $(this);

		var target = x.css('background-image')
			// remove the right and left braces, g to continue finiding and replace with ''
			.replace(/^url|[\)\()]/g, '');
			// console.log(target);

			x.wrap('<span style = "position: relative;"></span>')
				.parent() //span elements
				.prepend('<img>')
				.find('img:first') // selector is now new blank image
				.attr('src', target)

			x.css({
				'position' : 'absolute',
				'left' : 0,
				// 'top' : this.offsetTop
			});

			x.hover(function(){
				x.stop().animate({
					opacity: 0.4 
				}, 250);
			}, function(){
				x.stop().animate({
				 	opacity:1	
				}, 3000);
			});
		});
});


$('.thumbnail .imgcontainer').click(function(){
	console.log(this)
	var x = $(this);
	x.siblings('.namespacer').find('.namelist').slideToggle(300);
})


$('.wrongname').click(function(e) {
  console.log($(this).text());
  $(this).text( "hoo?")
});

$('.realname').click(function(e) {
	console.log($(this).text());
	e.stopPropagation();  //stops action from going one level up
	$(this).css('color','#53777a');
	$(this).siblings('.wrongname').remove();
	flip(this);
	// alert("Correct!");
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
		//animate complete
		// '<div>Animation complete.</div>'
		
		this.src = '/assets/woohoo.jpg';
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

