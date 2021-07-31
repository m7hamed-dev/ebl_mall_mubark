class Validation {
  static String? phoneValidate(String? value) {
    if (value!.length < 9) {
      return 'please check';
    }
    return null;
  }
  //
}
