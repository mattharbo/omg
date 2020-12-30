const updatepitch=document.getElementById("updatepitch");
const updatecage=document.getElementById("updatecage");
const eventTypeSelect=document.getElementById("goalevent_eventtype");

//-------------------------
const updatecoords = (event) => {

	const startradiostate=document.getElementById("startradio").checked;
	const endradiostate=document.getElementById("endradio").checked;
	const selectedtype = document.getElementById("goalevent_eventtype").value;

	if (startradiostate===true) {
		console.log("start => true");

		var previousStartPointer=document.getElementById("pointerstart");
		previousStartPointer.remove();

		document.getElementById("goalevent_startdepth").value=event.offsetY;
		document.getElementById("goalevent_startwidth").value=event.offsetX;

		updatepitch.insertAdjacentHTML("beforeend", `<div id="pointerstart" class="pointer_start" 
		style="top: ${event.offsetY-7}px;left: ${event.offsetX-7}px;"></div>`);
	}else if (endradiostate===true) {
		
		//if eventType is goal then end=location from cage + depth autodefine
		if (selectedtype == 1) {
			alert("Pick in goal area <<<");
		}else{
			alert("Can't do anything else than goal for now");
		}

	}else{
		alert("Start or end should be checked")
	}

};

//-------------------------
const updategoallocation = (event) => {

	var lastEndPointer=document.getElementById("pointerstop");

	if (lastEndPointer !== null) {
		lastEndPointer.remove();
	}
	
	updatecage.innerHTML="";

	document.getElementById("goalevent_goalxcoord").value=event.offsetX;
	document.getElementById("goalevent_goalycoord").value=event.offsetY;

	console.log(event.offsetX+"/"+event.offsetY);

	const goallocationonpitch = ((34/192)*event.offsetX)+155;

	document.getElementById("goalevent_enddepth").value=0;
	document.getElementById("goalevent_endwidth").value=goallocationonpitch.toFixed(1);

	updatecage.insertAdjacentHTML("beforeend", `<div class="pointer_goal" 
			style="top: ${event.offsetY-6}px;left: ${event.offsetX-6}px;"></div>`);

	updatepitch.insertAdjacentHTML("beforeend", `<div class="pointer_end" 
			style="top: 0px;left: ${goallocationonpitch}px;"></div>`);
};

//-------------------------
const changeEventType = (event) => {

	const selectedtype = document.getElementById("goalevent_eventtype").value;
	const type = document.getElementsByClassName("cagecontainer")[0];
	const endradiostate=document.getElementById("endradio");

	if (selectedtype == 1) {
		// if goal then make the cage visible
		type.style.visibility = "visible";

		endradiostate.checked = true;
		
		// and remove the last end point from the pitch
		var lastEndPointer=document.getElementById("pointerstop");
		lastEndPointer.remove();
	}else{
		type.style.visibility = "hidden";
		endradiostate.checked = false;
	}

};

//-------------------------
eventTypeSelect.addEventListener("change", changeEventType);
updatepitch.addEventListener("click", updatecoords);
updatecage.addEventListener("click", updategoallocation);
