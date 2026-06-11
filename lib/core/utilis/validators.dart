class Validators {

  Validators._();

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return " Please enter name ";
    }
    return null;
  }

    static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return " Please enter phone number ";
    }
    if(value.trim().length<10||value.trim().length>10){
      return "Please enter valid number";
    }

  }



  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value , String password) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value != password) {
      return ' Password doesnot match';
    }
    return null;
  }
}