$(function() {
	/* for client */
    $('#login-form-link-client').click(function(e) {
		$("#login-form-client").delay(100).fadeIn(100);
 		$("#register-form-client").fadeOut(100);
		$('#register-form-link-client').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#register-form-link-client').click(function(e) {
		$("#register-form-client").delay(100).fadeIn(100);
 		$("#login-form-client").fadeOut(100);
		$('#login-form-link-client').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	
	/* for lawyer */
	$('#login-form-link-lawyer').click(function(e) {
		$("#login-form-lawyer").delay(100).fadeIn(100);
 		$("#register-form-lawyer").fadeOut(100);
		$('#register-form-link-lawyer').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#register-form-link-lawyer').click(function(e) {
		$("#register-form-lawyer").delay(100).fadeIn(100);
 		$("#login-form-lawyer").fadeOut(100);
		$('#login-form-link-lawyer').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	
	/* for lawfirm */
	$('#login-form-link-lawfirm').click(function(e) {
		$("#login-form-lawfirm").delay(100).fadeIn(100);
 		$("#register-form-lawfirm").fadeOut(100);
		$('#register-form-link-lawfirm').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#register-form-link-lawfirm').click(function(e) {
		$("#register-form-lawfirm").delay(100).fadeIn(100);
 		$("#login-form-lawfirm").fadeOut(100);
		$('#login-form-link-lawfirm').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	
	// /* lawyer show page */
	// $('#personal-form-link').click(function(e) {
		// $("#personal-form").delay(100).fadeIn(100);
 		// $("#reset-pwd").fadeOut(100);
		// $('#reset-pwd-link').removeClass('active');
		// $(this).addClass('active');
		// e.preventDefault();
	// });
	// $('#reset-pwd-link').click(function(e) {
		// $("#reset-pwd").delay(100).fadeIn(100);
 		// $("#personal-form").fadeOut(100);
		// $('#personal-form-link').removeClass('active');
		// $(this).addClass('active');
		// e.preventDefault();
	// });

});	
function inputEmail(email, type_of_user, user_id) {
	var form = document.getElementById('login-form-' + type_of_user);
	form.email_check.value = email;
	checkEmail(type_of_user, user_id);
}

function inputVal(password, type_of_user) {
	var form = document.getElementById('register-form-' + type_of_user);
	form.password_match_check.value = password;
	check(type_of_user);
}

function check(type_of_user) {
	var form = document.getElementById('register-form-' + type_of_user);
	var new_password = form.password_match_check.value;
	var cnfrm_password = form.user_password_confirmation;
	if (cnfrm_password.value != new_password) {
		cnfrm_password.setCustomValidity('Password Must be Matching');
	} else {
		// input is valid -- reset the error message
		if (new_password.length < 8) {
			cnfrm_password.setCustomValidity('Password is too short (minimum is 8 characters)');
		} else {
			cnfrm_password.setCustomValidity('');
		}
	}
}

function checkEmail(type_of_user, user_id) {
	var form = document.getElementById('login-form-' + type_of_user);
	var email = form.email_check.value;
	var email_field = form.user_email;
	$.ajax({
		type : 'get',
		url : '/'+type_of_user+'_check_email',
		dataType : "json",
		data : {
			email : email,
			id : user_id
		},
		success : function(data, textStatus, xhr) {
			email_field.setCustomValidity(data.message);
		}
	});
}

