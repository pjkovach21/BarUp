// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function(){
	$(".js-event-date").on("change", function(){
		var eventDate = $(".js-event-date").val();
		// eventLoc = $(".js-bar-loc").val();
		console.log(eventDate)
		filterEvents(eventDate)
	});
});


function filterEvents(eventDate){
	// var today = new Date();
	// var tomorrow = new Date(new Date(now).setDate(now.getDate() + 1));
	// var nextWeek = new Date(new Date(now).setDate(now.getDate() + 7));
	// var nextMonth = new Date(new Date(now).setMonth(now.getMonth() + 1));

	console.log("filtering events", eventDate)
	$.ajax ({
		url: `/event/select/${eventDate}`,
		success: function(response){
			console.log("Event select", response);
			$(".js-event-list").empty();
					// if (response.length!==0){
					var eventNewArray = response.filter(
					
					function (event){
						var html =
						`
        				 <a class="social-icons modal-trigger" href="#modal3"> 
            				<li data-name ="event.title">
             
             				 <div class="card small smallcard">
              
               
               				 	<span class="card-title"> ${event.title}</span></a>
               				 	<div class="card-content">
               					 	${event.title}
                				</div>
                				<div class="card-action">
               					 <div> <a href="/events/${event.id}">Event Page</a></div>
               				 </div>
            			</div>

            
   						 <div id="modal3" class="modal modal-fixed-footer">
   						  <div class="modal-content">
     
     					 <h4>${event.title}</h4>
    					  <p>A bunch of text about how cool this website is</p>
   						 </div>
 
    					 <div class="modal-footer">
     					 <a href="/bars/sign_up" class="modal-action modal-close waves-effect waves-green btn-flat ">Follow</a>
    					  <a href="/events/${event.id}" class="modal-action modal-close waves-effect waves-green btn-flat center-align">Event Page</a>
     					 </div>
          				</li>
						`
					
					
					$(".js-event-list").append(html);
					// need to make the if empty statement work
					});
				// }
					// else{
					// 	alert("shit is empty")
					// }	
			},
			  
			//  var eventNewArray=response.filter(
			// 	 function (events){
			// 		console.log("Event inside of filter", eventDate);
			// 		return events.date === eventDate
			// 	 });
			//  console.log(eventNewArray)
			// if (eventNewArray.length!==0){
			// 	 eventNewArray.forEach (function(event){

			// 		$(".js-event-list").append(`<li>${response.title}</li>`);

			// 	});
			// }else{
			// 	alert("No events on this search")
			// }
			
			error: function(){
				console.log("shit hit the fan")
			}
	});
}