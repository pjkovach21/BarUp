// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var barType;
var barLoc;

var the_url

$(document).ready(function(){
	console.log("hi")
	// $(".js-bar-type").on("change", function(){
	// 	console.log(barType)
	// 	filterBars()
	// });
	$(".js-bar-loc").on("change", function(event){
		event.preventDefault()
		barType = $(".js-bar-type").val();
		barLoc = $(".js-bar-loc").val();
		console.log(barLoc)
		filterBars(barType, barLoc)
	});
});

// parmas: [location]
// .locations.bar_id important, i think that is how a location is called
// shoerten url, so if only one thing is chaged that that shows up
function filterBars(bartype, barloc){
	console.log(bartype)
	console.log("hi", barloc)
	
	$.ajax ({
		url: `bar/select/bar_type/${bartype}/locations/${barloc}`,
		success: function(response){
			console.log(response);
			$(".js-bar-list").empty();
			if (response.length!==0){
	            response.forEach (function(bar){
	            	
	            	$(".js-bar-list").append(`<li>${bar.bar}</li>`);

	            });
	        }else{
	        	alert("There are no bars in this category");
	        }

		},
		error: function(){
			console.log("something went wrong");
		}
	});
}


// // this is messed up
// // what am i 
// function filterLocation(barLoc){
// 	console.log("filter location")
// 	$.ajax ({
// 		// bar type is not defined in this function
// 		url: `bar/select?bar_type=${}&location=${barLoc}`,
// 		success: function(response){
// 		console.log(response, "2nd console")
// 		$(".js-bar-list").empty();
// 		varBarlocArray= response.filter(
// 			function (bar){
// 			$(".js-bar-list").append(`<li>${bar.bar}</li>`);
// 			});
// 		},
// 		error: function(){
// 		console.log("something went wrong");
// 		}
// 	});
	
// }
	


