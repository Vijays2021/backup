$(document).ready(()=>{
	$("#fullName").blur(()=>{
		fullName = document.getElementById("fullName").value;
		if(fullName==""){
			$('#fullnameErrorMsg').show();			
			$('#fullnameErrorMsg').html(" Alert: Please enter full name");
			$('#fullnameErrorMsg').css("background-color", "red");
			$('#fullnameErrorMsg').css("color", "white");
		}
		else{
		$('#fullnameErrorMsg').hide();
		}
	});
	/*$("#userName").blur(()=>{
		userName = document.getElementById("userName").value;
		if(userName==""){
			$('#usernameErrorMsg').show();			
			$('#usernameErrorMsg').html(" Alert: Please enter user name");
			$('#usernameErrorMsg').css("background-color", "red");
			$('#usernameErrorMsg').css("color", "white");
			event.preventDefault();
		}
		else
		{
			$('#usernameErrorMsg').hide();
		}
		
	});
	$("#password").blur(()=>{
		password = document.getElementById("password").value;
		if(password==""){
			$('#passworderrormsg').show();			
			$('#passworderrormsg').html(" Alert: Please enter password");
			$('#passworderrormsg').css("background-color", "red");
			$('#passworderrormsg').css("color", "white");
			event.preventDefault();
		}
		else
		{
			$('#passworderrormsg').hide();
		}
	});
	$("#email").blur(()=>{
		email = document.getElementById("email").value;
		if(email==""){
			$('#emailerrormsg').show();			
			$('#emailerrormsg').html(" Alert: Please enter email");
			$('#emailerrormsg').css("background-color", "red");
			$('#emailerrormsg').css("color", "white");
			event.preventDefault();
		}
		else
		{
			$('#emailerrormsg').hide();
		}
	});
	$("#contactNo").blur(()=>{
		contactNo = document.getElementById("contactNo").value;
		/*if(contactNo==""){
			$('#contactnoerrormsg').show();			
			$('#contactnoerrormsg').html(" Alert: Please enter contact no");
			$('#contactnoerrormsg').css("background-color", "red");
			$('#contactnoerrormsg').css("color", "white");
			event.preventDefault();
		}
		else
		{
			$('#contactnoerrormsg').hide();
		}
		
		let contactpattern = new RegExp("[0-9]{10}");
		if(!contactpattern.test(contactNo)){
			$('#contactnoerrormsg').show();			
			$('#contactnoerrormsg').html(" Alert: Please enter 10 digit");
			$('#contactnoerrormsg').css("background-color", "red");
			$('#contactnoerrormsg').css("color", "white");
		}
		else{
			$('#contactnoerrormsg').hide();
		}*/

});