import 'package:flutter_modular/flutter_modular.dart';

abstract class IPerfilRepository implements Disposable {
  Future fetchPost();
}
