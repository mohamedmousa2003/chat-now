class AppValidators {

  // ========== Name ==========
  static String? name(String? value, {int minLength = 3}) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }

    if (value.trim().length < minLength) {
      return 'Name must be at least $minLength characters';
    }

    final nameRegex = RegExp(r"^[a-zA-Z\u0600-\u06FF\s]+$");

    if (!nameRegex.hasMatch(value)) {
      return 'Name can only contain letters';
    }

    return null;
  }


  // ========== General ==========
  static String? requiredField(String? value, {String message = 'This field is required'}) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  // ========== Email ==========
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  // ========== Password ==========
  static String? password(String? value, {int minLength = 8}) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < minLength) {
      return 'Password must be at least $minLength characters';
    }
    return null;
  }

  // ========== Confirm Password ==========
  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  // ========== Phone ==========
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    final phoneRegex = RegExp(r'^(01)[0-9]{9}$'); // Egypt example
    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  // ========== Min Length ==========
  static String? minLength(String? value, int length) {
    if (value == null || value.length < length) {
      return 'Must be at least $length characters';
    }
    return null;
  }
}
