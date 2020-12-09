// let myFirstString = "Zup Matt! 🤙🏼"
// console.log(myFirstString)

const pitch=document.getElementById("pitch");

const retrievecoords = (event) => {
	pitch.innerHTML="";
	document.getElementById("goal_goalevents_attributes_0_endwidth").value=event.offsetX;
	document.getElementById("goal_goalevents_attributes_0_enddepth").value=event.offsetY;
	pitch.insertAdjacentHTML("beforeend", `<div class="pointer" 
		style="top: ${event.offsetY-7}px;left: ${event.offsetX-7}px;"></div>`);
};

pitch.addEventListener("click", retrievecoords);