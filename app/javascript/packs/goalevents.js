const pitch=document.getElementById("pitch");
const cage=document.getElementById("thecage");

//-------------------------
const retrievecoords = (event) => {

	pitch.innerHTML="";
	document.getElementById("goal_goalevents_attributes_0_startwidth").value=event.offsetX;
	document.getElementById("goal_goalevents_attributes_0_startdepth").value=event.offsetY;

	pitch.insertAdjacentHTML("beforeend", `<div class="pointer_start" 
		style="top: ${event.offsetY-7}px;left: ${event.offsetX-7}px;"></div>`);
};

//-------------------------
const goallocation = (event) => {

	cage.innerHTML="";

	document.getElementById("goal_goalevents_attributes_0_goalxcoord").value=event.offsetX;
	document.getElementById("goal_goalevents_attributes_0_goalycoord").value=event.offsetY;

	const goallocationonpitch = ((34/192)*event.offsetX)+155;

	document.getElementById("goal_goalevents_attributes_0_enddepth").value=0;
	document.getElementById("goal_goalevents_attributes_0_endwidth").value=goallocationonpitch.toFixed(1);

	cage.insertAdjacentHTML("beforeend", `<div class="pointer_goal" 
			style="top: ${event.offsetY-6}px;left: ${event.offsetX-6}px;"></div>`);

	pitch.insertAdjacentHTML("beforeend", `<div class="pointer_end" 
			style="top: 0px;left: ${goallocationonpitch}px;"></div>`);
};

//-------------------------
pitch.addEventListener("click", retrievecoords);
cage.addEventListener("click", goallocation);