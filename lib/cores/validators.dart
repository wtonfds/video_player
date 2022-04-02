import 'package:seventh_player/cores/constants.dart';

class Validators {
  static String? validarUsername(String input) {
    return input.isEmpty ? 'Username is mandatory' : null;
  }

  static String? validatePassword(String input) {
    return input.isEmpty ? 'Password is mandatory' : null;
  }
}
