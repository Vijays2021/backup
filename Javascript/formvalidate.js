function printError(elemId, hintMsg) {
    document.getElementById(elemId).innerHTML = hintMsg;
}

function validateForm() {
    
    var name = document.getElementById('userName').value;
    var email = document.myForm.email.value;
    var password = document.myForm.password.value;
    var education = document.myForm.education.value;
    var gender = document.myForm.gender.value;
	var occupation = document.myForm.Occupation.value;
    var hobbies = [];
    var checkboxes = document.getElementsByName("hobbies[]");
    for(var i=0; i < checkboxes.length; i++) {
        if(checkboxes[i].checked) {
            hobbies.push(checkboxes[i].value);
        }
    }
    var nameErr = emailErr = pwdErr = occupationErr = educationErr = hobbiesErr = genderErr = true;
    if(name == "") {
        printError("nameErr", "Please enter your name");
    } else {
        var regex = /^[a-zA-Z\s]+$/;                
        if(regex.match(name) == false) {
            printError("nameErr", "Please enter a valid name");
        } else {
            printError("nameErr", "");
            nameErr = false;
        }
    }
    if(email == "") {
        printError("emailErr", "Please enter your email address");
    } else {
        var regex = ('^[^\.|@][a-z|0-9]+@[a-z]+\.[a-z]*[m|n]$');
        if(regex.match(email) === false) {
            printError("emailErr", "Please enter a valid email address");
        } else{
            printError("emailErr", "");
            emailErr = false;
        }
    }
    if(password == "") {
        printError("pwdErr", "Please enter your password");
    } else {
        var regex = /^(a-bA-B0-9)*{8,}$/
        if(regex.match(password) === false) {
            printError("pwdErr", "Please enter a valid 8 digit  password");
        } else{
            printError("pwdErr", "");
            pwdErr = false;
        }
    }
    if(occupation == "") {
        printError("occupationErr", "Please select your occupation");
    } else {
        printError("occupationErr", "");
        occupationErr = false;
    }
    if(education.value == "") {
        document.getElementById("education").innerHTML = "Please Select";
    } else {
        printError("educationErr", "");
        educationErr = false;
    }
    if(gender == "") {
        printError("genderErr", "Please select your gender");
    } else {
        printError("genderErr", "");
        genderErr = false;
    }
	
	if (select == "") {
    printError("educationErr","Please select an option");
	} else {
		printError("educationErr", "");
		educationErr = false;
	}
	if(hobbies == "") {
        printError("hobbiesErr", "Please select your hobbies");
    } else {
        printError("hobbiesErr", "");
        hobbiesErr = false;
    }
	
    if((nameErr || emailErr || pwdErr || hobbiesErr  || occupationErr || educationErr || genderErr) == true) {
       return false;
    } else {
        var dataPreview = "You've entered the following details: \n" +
                          "Full Name: " + name + "\n" +
                          "Email Address: " + email + "\n" +
                          "Password: " + "********" + "\n" +
                          "Education: " + education + "\n" +
						  "Occupation: " + occupation + "\n" +
                          "Gender: " + gender + "\n";
        if(hobbies.length) {
            dataPreview += "Hobbies: " + hobbies.join(", ");
        }
        alert(dataPreview);
    }
}

console.log(validateForm());