import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../call/presentation/Widget/pickup_layout.dart';
import '../../export.dart';
import 'post_widget.dart';

class ReportedPosts extends StatelessWidget {
  final repo = Modular.get<AdminRepo>();
  @override
  Widget build(BuildContext context) {
    return PickUpLayout(
      scaffold: Scaffold(
        appBar: AppBar(
          title: Text(t.Admin.posts),
          centerTitle: true,
        ),
        body: StreamBuilder<List<Post>>(
          stream: repo.reportedPostsStream(),
          builder: (_, snap) {
            final posts = snap.data ?? <Post>[];
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (_, i) => PostWidget(post: posts[i]),
            );
          },
        ),
      ),
    );
  }
}
