const sharebtn=document.getElementById("sharebutton");

//-------------------------
const copytoclipboard = (event) => {

	var dummy = document.createElement('input'),
    	text = window.location.href;

    alert("URL copied in your clipboard");

	document.body.appendChild(dummy);
	dummy.value = text;
	dummy.select();

	document.execCommand('copy');
	document.body.removeChild(dummy);
	
};

//-------------------------

sharebtn.addEventListener("click", copytoclipboard);