const updatepitch=document.getElementById("updatepitch");

// const cage=document.getElementById("thecage");


//-------------------------
const updatecoords = (event) => {

	const startradiostate=document.getElementById("startradio").checked;
	const endradiostate=document.getElementById("endradio").checked;

	if (startradiostate===true) {
		console.log("start => true");

		var previousStartPointer=document.getElementById("pointerstart");
		previousStartPointer.remove();

		document.getElementById("goalevent_startdepth").value=event.offsetY;
		document.getElementById("goalevent_startwidth").value=event.offsetX;

		updatepitch.insertAdjacentHTML("beforeend", `<div id="pointerstart" class="pointer_start" 
		style="top: ${event.offsetY-7}px;left: ${event.offsetX-7}px;"></div>`);
	}else if (endradiostate===true) {
		alert("Cage to come…")
	}else{
		alert("Start or end should be checked")
	}

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
updatepitch.addEventListener("click", updatecoords);

// cage.addEventListener("click", goallocation);