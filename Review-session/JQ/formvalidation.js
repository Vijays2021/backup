$(document).ready(()=>{

	$("#userName").blur(()=>{
		userName = $('#userName').val();
		if(userName==""){
			$('#usernameErrorMsg').show();			
			$('#usernameErrorMsg').html(" Alert: Please Enter user name");
			$('#usernameErrorMsg').css("background-color", "red");
			$('#usernameErrorMsg').css("color", "white");
			
			}
		else
		{
			$('#usernameErrorMsg').hide();
		}
		
	});
	
	$("#email").blur(()=>{
		email = $('#email').val();
		if(userName==""){
			$('#emailErrorMsg').show();			
			$('#emailErrorMsg').html(" Alert: Please Enter user email");
			$('#emailErrorMsg').css("background-color", "red");
			$('#emailErrorMsg').css("color", "white");
			
			}
		else
		{
			$('#emailErrorMsg').hide();
		}
		
	});
	
	$("#phone").blur(()=>{
		phone = $('#phone').val();
		if(userName==""){
			$('#phoneErrorMsg').show();			
			$('#phoneErrorMsg').html(" Alert: Please Enter user contact");
			$('#phoneErrorMsg').css("background-color", "red");
			$('#phoneErrorMsg').css("color", "white");
			
			}
		else
		{
			$('#phoneErrorMsg').hide();
		}
		
	});
	
	$ ("#phone").keypress(function(){
		 $('span.error-keyup-1').hide();
    var inputVal = $(this).val();
    var numericReg = /^\d{10}$/;
    if(!numericReg.test(inputVal)) {
        $(this).after('<span class="error error-keyup-1">Numeric characters only.</span>');
    }

	});
	
	$("#password").blur(()=>{
		password = $('#password').val();
		if(userName==""){
			$('#passwordErrorMsg').show();			
			$('#passwordErrorMsg').html(" Alert: Please Enter user Password");
			$('#passwordErrorMsg').css("background-color", "red");
			$('#passwordErrorMsg').css("color", "white");
			
			}
		else
		{
			$('#passwordErrorMsg').hide();
		}
		
	});

});	
	