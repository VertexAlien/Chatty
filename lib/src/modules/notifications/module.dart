import 'package:flutter_modular/flutter_modular.dart';
import 'export.dart';

class NotificationModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => NotificationsRepoImp()),
        Bind((i) => NotificationController()),
        Bind((i) => NotificationsHelper()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(NOTIFICATIONS, child: (_, args) => NotificationScreen()),
      ];

  static const NOTIFICATIONS = '/notifications';
  static Future toNotifications() => Modular.to.pushNamed(NOTIFICATIONS);
}
