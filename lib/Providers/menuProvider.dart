import 'package:flutter/cupertino.dart';

class ProviderMenu extends ChangeNotifier {
  int _menuSeleccionado = 0;
  bool _isObscure = true;

  int get menuSeleccionado {
    return this._menuSeleccionado;
  }

  bool get isObscure {
    return this._isObscure;
  }

  set verContra(bool verContrasena) {
    (verContrasena != this._isObscure) ? this._isObscure = verContrasena : null;
    notifyListeners();
  }

  set opcionMenuSeleccionado(int i) {
    this._menuSeleccionado = i;
    notifyListeners();
  }
}
