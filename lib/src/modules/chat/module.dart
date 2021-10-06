import 'package:flutter_modular/flutter_modular.dart';
import 'export.dart';

class ChatModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ChatRepoImp()),
        Bind((i) => ChatController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(CHATS, child: (_, args) => ChatScreen()),
        ModularRouter('$CHATS/:userId',
            child: (_, args) => Conversation(args.params['userId'])),
      ];

  static const CHATS = '/chats';

  static Future<void> toChats() => Modular.to.pushNamed(CHATS);
  static Future<void> toConversation(String id) async {
    final notController = Modular.get<NotificationController>();
    notController.updateUserLocation(UserNavigationTracker.chatting(id));
    await Modular.to.pushNamed('$CHATS/$id');
    notController.updateUserLocation(UserNavigationTracker.onChatScreen());
  }
}
