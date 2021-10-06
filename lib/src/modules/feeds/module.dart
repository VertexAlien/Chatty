import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'export.dart';
import 'presentation/posts/feed/widgets/report.dart';

class FeedsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PostRepoImp()),
        Bind((i) => CommentRepoImp()),
        Bind((i) => FeedController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(FEED, child: (_, args) => FeedScreen()),
        ModularRouter(
          '$POST/:id',
          child: (_, args) => SinglePostScreen(postId: args.params['id']),
        ),
        ModularRouter(CREATE_POST, child: (_, args) => PostEditor()),
        ModularRouter(
          '$COMMENTS/:postId/:authorId',
          child: (_, args) =>
              CommentsScreen(args.params['postId'], args.params['authorId']),
        ),
        ModularRouter(
          '$REPLY/:postId/:commentId',
          child: (_, args) =>
              ReplyScreen(args.params['postId'], args.params['commentId']),
        ),
      ];

  static const FEED = '/feed',
      POST = '/post',
      CREATE_POST = '/create_post',
      COMMENTS = '/comments',
      REPLY = '/reply',
      REACTIONS = '/reactions';

  static Future toPost(String id) => Modular.to.pushNamed('$POST/$id');
  static Future toComments(String postId, String authorId) =>
      Modular.to.pushNamed('$COMMENTS/$postId/$authorId');
  static Future toReply(String postId, String commentId) =>
      Modular.to.pushNamed('$REPLY/$postId/$commentId');
  static Future toCreatPost() => Modular.to.pushNamed(CREATE_POST);
  static Future toEditPost(Post post) => _to(PostEditor(toEditPost: post));
  static Future toReactions(List<String> ids) =>
      _to(ReactionsScreen(likesId: ids));
  static Future toReportPost(Post post) => _to(ReportScreen(post: post));

  static Future _to(Widget screen) =>
      Modular.to.navigator.push(MaterialPageRoute(builder: (_) => screen));
}
