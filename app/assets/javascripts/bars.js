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
		// event.preventDefault()
		barType = $(".js-bar-type").val();
		barLoc = $(".js-bar-loc").val();
		console.log(barLoc)
		console.log(barType)
		filterBars(barType, barLoc)
	});
	$('.modal-trigger').leanModal();
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
	            	console.log(bar)
	            	var html =
	            			`
						   <a class="social-icons modal-trigger" href="#modal4"> 
        						<li data-name ="bar.bar_type">
        						  <div class="card small smallcard">
         						   <span class="card-title"> ${bar.bar}</span></a>
           						 <div class="card-content">
                					${bar.bar_type}
               						 
           						 </div>
           						 <div class="card-action">
             						 <div><a href="/bars/${bar.id}"> Bar Page</a></div>
          						  </div>
          						</div>
         					<div id="modal4" class="modal modal-fixed-footer">
          				 <div class="modal-content">
     
             				<h4>${bar.bar}</h4>
             				<p>A bunch of text about how cool this website is</p>
          				</div>
 
         				<div class="modal-footer">
         				 <a href="/bars/${bar.id}/follow" class="modal-action modal-close waves-effect waves-green btn-flat center-align">follow</a>
     					 <a href="/bars/${bar.id}" class="modal-action modal-close waves-effect waves-green btn-flat "> Bar Page</a>
         				</div>
         				 </li>
						`

	            	$(".js-bar-list").append(html);

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
	


