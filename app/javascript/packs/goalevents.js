const pitch=document.getElementById("pitch");
const lastpointer=document.querySelectorAll(".poiner");

const retrievecoords = (event) => {

	if (document.getElementById("startgoal").checked) {
		// si c'est FALSE !!!!
		pitch.innerHTML="";
		document.getElementById("goal_goalevents_attributes_0_startwidth").value=event.offsetX;
		document.getElementById("goal_goalevents_attributes_0_startdepth").value=event.offsetY;

		document.querySelectorAll(".goalcoords small")[0].innerText=`Goal start coords: ${event.offsetX}/${event.offsetY}`;

		pitch.insertAdjacentHTML("beforeend", `<div class="pointer_start" 
			style="top: ${event.offsetY-7}px;left: ${event.offsetX-7}px;"></div>`);

	} else {
		// si c'est TRUE !!

		document.getElementById("goal_goalevents_attributes_0_endwidth").value=event.offsetX;
		document.getElementById("goal_goalevents_attributes_0_enddepth").value=event.offsetY;

		document.querySelectorAll(".goalcoords small")[1].innerText=`Goal end coords: ${event.offsetX}/${event.offsetY}`;

		pitch.insertAdjacentHTML("beforeend", `<div class="pointer_end" 
			style="top: ${event.offsetY-4}px;left: ${event.offsetX-4}px;"></div>`);
	}
	
};

pitch.addEventListener("click", retrievecoords);