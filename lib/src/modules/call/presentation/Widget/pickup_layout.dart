import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../auth/export.dart';
import '../../data/call_repo.dart';
import '../../domain/call.dart';
import '../../presentation/index.dart';

class PickUpLayout extends StatelessWidget {
  final Widget scaffold;
  final CallRepo callRepo = CallRepo();
  final User user = User();

  PickUpLayout({
    @required this.scaffold,
  });

  @override
  Widget build(BuildContext context) {
    var currentUser = Modular.get<AuthController>().currentUser;

    return (currentUser != null)
        ? StreamBuilder<DocumentSnapshot>(
            stream: callRepo.callStream(uid: currentUser.id),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data.data() != null) {
                var call = Call.fromMap(snapshot.data.data());

                if (!call.hasDialled) {
                  return PickupScreen(
                    call: call,
                  );
                }
              }
              return scaffold;
            })
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
