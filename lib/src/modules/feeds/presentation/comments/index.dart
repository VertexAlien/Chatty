import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_social_messenger/src/core/ad.dart';
import 'package:flutter_social_messenger/src/modules/call/presentation/Widget/pickup_layout.dart';
import 'package:mobx/mobx.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../export.dart';
import '../comments/widgets/shimmer.dart';
import 'controller.dart';
import 'widgets/comment_widget.dart';
import 'widgets/input.dart';

class CommentsScreen extends WidgetModule {
  final String postId, postAuthorId;

  CommentsScreen(this.postId, this.postAuthorId);

  @override
  List<Bind> get binds =>
      [Bind((_) => CommentsController(postId, postAuthorId))];

  @override
  Widget get view => _CommentsScreen();
}

class _CommentsScreen extends StatefulWidget {
  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState
    extends ModularState<_CommentsScreen, CommentsController> {
  final adController = AdManager();
  InterstitialAd _interstitialAd;

  @override
  void initState() {
    if (pageCount >= 5) {
      _interstitialAd = adController.interstitialAd();

      adController.loadInterstitialAd(interstitialAd: _interstitialAd);
      pageCount = 0;
    } else {
      pageCount++;
    }

    super.initState();
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PickUpLayout(
      scaffold: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            t.Feed.comments,
            style: theme.textTheme.headline6,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: Container(
            height: 40,
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Expanded(
              child: StreamBuilder(
                stream: controller.commentsStream,
                builder: (_, snap) {
                  if (snap.connectionState == ConnectionState.waiting) {
                    return CommentShimmer();
                  }
                  controller.comments =
                      ObservableList.of(snap.data ?? controller.comments);
                  return SmartRefresher(
                    controller: controller.refreshController,
                    enablePullUp: false,
                    enablePullDown:
                        controller.commentsOffset <= controller.comments.length,
                    dragStartBehavior: DragStartBehavior.down,
                    onRefresh: controller.onRefresh,
                    child: ListView.builder(
                      controller: controller.scrollController,
                      reverse: true,
                      itemCount: controller.comments.length,
                      itemBuilder: (_, index) =>
                          CommentWidget(comment: controller.comments[index]),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            CommentInput(
              onSubmit: (content) async {
                if (content.isEmpty) return;
                await Future.delayed(Duration(milliseconds: 50))
                    .then((_) => controller.textController.clear());
                await controller.addComment(content);
              },
            ),
          ],
        ),
      ),
    );
  }
}
