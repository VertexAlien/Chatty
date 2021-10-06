import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;

import '../../export.dart';

class UserRepoImp implements UserRepository {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  CollectionReference get _userCollection => _firestore.collection('users');

  DocumentReference _userDocument(String userId) => _userCollection.doc(userId);
  @override
  Future<User> fetchUserData(String userID) async {
    final doc = await _userDocument(userID).get();
    if (doc.data() == null) return null;
    return User.fromJson(doc.data() ?? {});
  }

  @override
  Future<User> registerUser({
    String username,
    String email,
    String gender,
    String photoUrl,
    String status,
    String password,
  }) async {
    final existingUser =
        await _firestore.collection('userName').doc('$username').get();

    if (existingUser.exists) {
      throw Exception('Username is Taken.');
    }

    final fUser = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (fUser == null) throw Exception('Something Went Wrong');

    final user = User.createNew(
      uid: fUser.user.uid,
      name: username ?? fUser.user.displayName,
      email: email,
      gender: gender,
      photoUrl: photoUrl ?? '',
      status: status,
    );
    await _userDocument(user.id).set(user.toJson());
    await _firestore
        .collection('userName')
        .doc('${user.name}')
        .set({'email': user.email});
    await fUser.user.updateProfile(displayName: user.name, photoURL: user.name);
    return user;
  }

  @override
  Stream<User> getUserStream(String userID) =>
      _userDocument(userID).snapshots().map((s) => User.fromJson(s.data()));

  @override
  Stream<List<User>> onlineUsers() => _userCollection
      .where('isOnline', isEqualTo: true)
      .where('onlineStatus', isEqualTo: true)
      .orderBy('lastTimeSeen', descending: true)
      .limit(20)
      .snapshots()
      .map(
        (s) => [for (final doc in s.docs) User.fromJson(doc.data())],
      )
      .handleError(print);

  @override
  Future<void> setUserAsActive(String userId, bool isActive) {
    return _userDocument(userId).update(
      {'isOnline': isActive, 'lastTimeSeen': FieldValue.serverTimestamp()},
    );
  }

  @override
  Future<void> updateUseInfo(User user) => _userDocument(user.id).update(
        user.toJson()
          ..['lastTimeSeen'] = FieldValue.serverTimestamp()
          ..['isOnline'] = true,
      );
  @override
  Future<void> followUser(String currentUserId, String otherId) async {
    await _userDocument(currentUserId).update({
      'following': FieldValue.arrayUnion([otherId])
    });
    await _userDocument(otherId).update({
      'followers': FieldValue.arrayUnion([currentUserId])
    });
  }

  @override
  Future<void> unFollowUser(String currentUserId, String otherId) async {
    await _userDocument(currentUserId).update({
      'following': FieldValue.arrayRemove([otherId])
    });
    await _userDocument(otherId).update({
      'followers': FieldValue.arrayRemove([currentUserId])
    });
  }

  @override
  Future<void> updateBlockedUsers(
      String currentUserId, List<String> blockedUsers) async {
    await _userDocument(currentUserId).update({'blockedUsers': blockedUsers});
  }

  @override
  Future<bool> checkIfUserExist(String uid) async =>
      (await _userCollection.doc(uid).get()).exists;

  /// Checks if the given username is already taken or not and returns the according bool.
  @override
  Future<bool> checkIfUsernameTaken(String username) async {
    final result =
        await _userCollection.where('name', isEqualTo: username).get();
    return result.docs.isNotEmpty;
  }

  @override
  Future<void> banUser(String userId) => CloudFunctions.instance
      .getHttpsCallable(functionName: 'banUser')
      .call({'userId': userId});
}
