// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
	$(".js-bar-type").on("change", function(){
		var barType = $(".js-bar-type").val();
		console.log(barType)
		filterBars(barType)
	});
	$(".js-bar-location").on("change", function(){
		var barLoc = $(".js-bar-location").val();
		console.log(barLoc)
		filterLocation(barLoc)
	});
});


function filterBars(barType){
	console.log("filtering Bars")
	$.ajax ({
		url: `bar/select`,
		success: function(response){
			console.log(response);
			$(".js-bar-list").empty();

            var barNewArray=response.filter(
				function (bars){
				   return bars.bar_type===barType
				})
			console.log(barNewArray)
			if (barNewArray.length!==0){
	            barNewArray.forEach (function(bar){
	            	
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


// this is messed up
// what am i 
function filterLocation(barLoc){
	console.log("filter location")
	$.ajax ({
		// bar type is not defined in this function
		url: `bar/select/?bar_type=${barType}&neighnorhood=${barLoc}`,
		success: function(response){
		console.log(response, "2nd console")
		$(".js-bar-list").empty();
		varBarlocArray= response.filter(
			function (bar){
			$(".js-bar-list").append(`<li>${bar.bar}</li>`);
			});
		},
		error: function(){
		console.log("something went wrong");
		}
	});
	
}
	


