isValid(value, msg) {
  if (value == null || value.isEmpty) {
    return msg;
  }
  return null;
}

phoneValidator(value) {
  if (value!.isEmpty) {
    return 'Phone Number required';
  } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
    return 'Incorrect phone format';
  } else {
    return null;
  }
}

passwordValidator(value) {
  if (value!.isEmpty) {
    return 'Passwords required';
  }else if( !RegExp(r'(?=.*?[#?!@$%^&*-]).{4,}$').hasMatch(value)){
    return  'Passwords must have at least one special character';
  } else {
    return null;
  }
}

nameValidator(value) {
  if (value!.isEmpty) {
    return 'Name required';
  }else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
    return 'Incorrect name format';
  } else {
    return null;
  }
}

emailValidator(value) {
  if (value!.isEmpty) {
    return 'Email required';
  }else if(!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(value)){
            return 'Incorrect email format';
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
