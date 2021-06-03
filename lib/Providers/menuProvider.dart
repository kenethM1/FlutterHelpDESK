import 'package:flutter/cupertino.dart';

class ProviderMenu extends ChangeNotifier {
  int _menuSeleccionado = 0;

  int get menuSeleccionado {
    return this._menuSeleccionado;
  }

  set opcionMenuSeleccionado(int i) {
    this._menuSeleccionado = i;
    notifyListeners();
  }
}
