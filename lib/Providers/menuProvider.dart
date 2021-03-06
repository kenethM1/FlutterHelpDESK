import 'package:flutter/cupertino.dart';

class ProviderMenu extends ChangeNotifier {
  int _menuSeleccionado = 0;
  bool _isObscure = true;
  String userID = '';

  int get menuSeleccionado {
    return this._menuSeleccionado;
  }

  bool get isObscure {
    return this._isObscure;
  }

  String get userId {
    return this.userID;
  }

  set setUserID(String id) {
    this.userID = id;
    notifyListeners();
  }

  set verContra(bool verContrasena) {
    // ignore: unnecessary_statements
    (verContrasena != this._isObscure) ? this._isObscure = verContrasena : null;
    notifyListeners();
  }

  set opcionMenuSeleccionado(int i) {
    this._menuSeleccionado = i;
    notifyListeners();
  }
}
