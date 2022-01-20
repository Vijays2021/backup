'use strict';

$('#regForm').on('submit', function(e) {
  // Check if the form was previously submitted
  if ($(this).hasClass('form-submitted')) {
    e.preventDefault(); // Prevent form from being submitted again
  } else {
    $(this).addClass('form-submitted'); // Add a class to identify form as being submitted already
    $('#username').attr('readonly', true); 
    $('#email').attr('readonly', true); 
    $('#submitButton').attr('disabled', true); 
  }
});

var formValid = {
  username: false, 
  email: false
};

// Function to check if fields have passed validation
function checkValidation() {
  if (formValid.username && formValid.email) {
    $('#submitButton').removeAttr('disabled'); // Allow submitting of form
  } else {
    $('#submitButton').attr('disabled', true); 
  }
}

// Validation for Username input field
$('#username').on('input', function() {
  var username = $(this).val(); 

  // Function to set a custom message
  function msg(body) {
    $('#username-error').text(body).show(); 
  };

  // Function to hide paragraph tag
  function hide() {
    $('#username-error').hide(); 
  };

  // Check if username has at least one charactar
  if (username.length < 1) {
    msg('This field is required.');
    formValid.username = false; 
    checkValidation(); 
  } else {
    hide(); // Hide previous error message
    formValid.username = true; 
    checkValidation(); 
    var testExp = new RegExp(/^[a-zA-Z0-9]+$/); 
    
    if (!testExp.test(username)) {
      msg('Must not have any special characters'); 
      formValid.username = false; 
      checkValidation(); 
    } else {
      hide(); 
      formValid.username = true; 
      checkValidation(); 
      // Check if username meets length requirements
      if (username.length < 3 || username.length > 10) {
        msg('Must be at least 3 characters but no more than 10'); 
        formValid.username = false; 
        checkValidation(); 
      } else {
        hide(); 
        formValid.username = true; 
        checkValidation(); 
      }
    }
  }
});

// Validation for E-mail Input
$('#email').on('input', function() {
  var email = $(this).val(); 

  
  function msg(body) {
    $('#email-error').text(body).show(); 
  };

  // Function to hide error message
  function hide() {
    $('#email-error').hide(); /
  };

  // Check if e-mail value is at least 1 character
  if (email.length < 1) {
    msg('This field is required.'); 
    formValid.email = false; 
    checkValidation(); 
  } else {
    hide(); 
    formValid.email = true; 
    checkValidation(); 
    var testExp = new RegExp(/[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$/); 

    if (!testExp.test(email)) {
      msg('Must be a valid e-mail'); 
      formValid.email = false; 
      checkValidation(); 
    } else {
      hide(); 
      formValid.email = true; 
      checkValidation(); 
      // Check if e-mail value meets length requirements
      if (email.length < 3 || email.length > 30) {
        msg('Must be at least 3 characters but no more than 30'); 
        formValid.email = false; 
        checkValidation(); 
      } else {
        hide(); 
        formValid.email = true; 
        checkValidation(); 
      }
    }
  }
});
