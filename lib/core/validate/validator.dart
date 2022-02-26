class Validator {
  static String? email(String? value) {
    if (value!.isEmpty)
      return 'Email Empty!';
    else if (!value.contains('@') || !value.contains('.com'))
      return 'EX: example@example.com';
  }

  static String? password(String? value) {
    if (value!.isEmpty)
      return 'Password Empty!';
    else if (value.length < 8) return 'Password must be at least 8 digit';
  }

  static String? phoneNumber(String? value) {
    if (value!.isEmpty) return 'Phone Number Empty';
  }
   static String? name(String? value) {
    if (value!.isEmpty) return 'Name is Empty';
  }
//  static String? confirmEmail(String? value) {
//     if (value!== em) return 'Phone Number Empty';
//   }


}
