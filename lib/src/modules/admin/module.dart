import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'export.dart';
import 'presentation/posts/index.dart';

class AdminModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AdminRepo()),
      ];

  @override
  List<ModularRouter> get routers => [];

  static Future toReportedPosts() => _to(ReportedPosts());
  static Future _to(Widget screen) =>
      Modular.to.navigator.push(MaterialPageRoute(builder: (_) => screen));
}
