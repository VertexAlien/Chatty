import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../domain/call.dart';

class CallRepo {
  final CollectionReference callCollection =
      FirebaseFirestore.instance.collection('calls');

  ///Agora App_ID
  final APP_ID = "d83cc420f35844899d12118ddf92d551";

  Stream<DocumentSnapshot> callStream({String uid}) =>
      callCollection.doc(uid).snapshots();

  Future<bool> makeVideoCall({Call call}) async {
    try {
      call.hasDialled = true;
      call.isCall = "video";
      var hasDialledMap = call.toMap(call);

      call.hasDialled = false;
      call.isCall = "video";
      var hasNotDialledMap = call.toMap(call);

      await callCollection.doc(call.callerId).set(hasDialledMap);
      await callCollection.doc(call.receiverId).set(hasNotDialledMap);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> makeVoiceCall({Call call}) async {
    try {
      call.hasDialled = true;
      call.isCall = "audio";
      var hasDialledMap = call.toMap(call);

      call.hasDialled = false;
      call.isCall = "audio";
      var hasNotDialledMap = call.toMap(call);

      await callCollection.doc(call.callerId).set(hasDialledMap);
      await callCollection.doc(call.receiverId).set(hasNotDialledMap);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> endCall({Call call, BuildContext context}) async {
    try {
      await callCollection.doc(call.callerId).delete();
      await callCollection.doc(call.receiverId).delete();
      Navigator.pop(context);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
