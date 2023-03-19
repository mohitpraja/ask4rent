isValid(value, msg) {
  if (value == null || value.isEmpty) {
    return msg;
  }
  return null;
}

phoneValidator(value) {
  if (value!.isEmpty || !RegExp(r'^[0-9]{10}$').hasMatch(value)) {
    return 'Incorrect Phone Number';
  } else {
    return null;
  }
}

passwordValidator(value) {
  if (value!.isEmpty || !RegExp(r'(?=.*?[#?!@$%^&*-]).{6,}$').hasMatch(value)) {
    return 'Passwords must have at least one special character';
  } else {
    return null;
  }
}

nameValidator(value) {
  if (value!.isEmpty ||
      !RegExp(r'^[a-z A-Z/+0-9]+$').hasMatch(value)) {
    return 'Enter Correct Field';
  } else {
    return null;
  }
}

emailValidator(value) {
  if (value!.isEmpty ||
      !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(value)) {
    return 'Enter Correct Email';
  } else {
    return null;
  }
}

confirmPasswordValidator(value, password) {
  if (value!.isEmpty) {
    return 'Confirm Password required';
  }
  if (value != password) {
    return 'Password Do Not Match';
  }
  return null;
}
