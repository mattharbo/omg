const pitch=document.getElementById("pitch");

const retrievecoords = (event) => {
	pitch.innerHTML="";
	document.getElementById("goal_goalevents_attributes_0_startwidth").value=event.offsetX;
	document.getElementById("goal_goalevents_attributes_0_startdepth").value=event.offsetY;

	document.querySelector(".goalcoords small").innerText=`Goal start coords: ${event.offsetX}/${event.offsetY}`;

	pitch.insertAdjacentHTML("beforeend", `<div class="pointer" 
		style="top: ${event.offsetY-7}px;left: ${event.offsetX-7}px;"></div>`);
};

pitch.addEventListener("click", retrievecoords);