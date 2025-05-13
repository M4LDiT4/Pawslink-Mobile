
class TValidator{
  TValidator._();
  
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$');
    if (!passwordRegex.hasMatch(value)) {
      return 'Password must be at least 8 characters long,\ninclude upper/lowercase letters, a number, and a symbol';
    }

    return null;
  }

  static String? validateUsername(String? username) {
    final pattern = RegExp(r'^(?!.*[._]{2})(?![._])(?!.*[._]$)[a-zA-Z0-9._]{3,20}$');

    if (username == null || username.trim().isEmpty) {
      return 'Username is required';
    }

    if (!pattern.hasMatch(username)) {
      return 'Username must be 3-20 characters, use letters, numbers, ".", "_", and avoid special characters at the start, end, or consecutively.';
    }

    return null; // Valid
  }

  static String? validateConfirmPass(String? password, String confirmPass){
    if(password != confirmPass || password == null || confirmPass.isEmpty){
      return "Passwords do not match";
    }
    return null;
  }

}