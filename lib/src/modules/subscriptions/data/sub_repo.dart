import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/subs.dart';

class SubRepository {
  final CollectionReference subsCollection =
      FirebaseFirestore.instance.collection('subscriptions');

  Future<bool> registerSub(Subs sub) async {
    try {
      await subsCollection.doc(sub.userId).set(sub.toMap(sub));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> checkSubscription(String uid) async {
    try {
      final doc = await subsCollection.doc(uid).get();

      if (!doc.exists) {
        return false;
      }

      DateTime endDate = doc.get("endDate").toDate();
      var now = DateTime.now();

      print("end Date is :  $endDate");
      print("Now Date is :  $now");

      if (now.isBefore(endDate)) {
        return true;
      } else {
        await subsCollection.doc(uid).delete();
        return false;
      }
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }
}
