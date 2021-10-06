import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_callkeep/flutter_callkeep.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';

import '../export.dart';

NotificationController get notController =>
    Modular.get<NotificationController>();

class NotificationsHelper {
  final _firebaseMessaging = FirebaseMessaging();

  Future<void> registerNotification(String currentUserID, bool newLogin) async {
    //if (kDebugMode) return;

    if (newLogin) {
      try {
        final token = await _firebaseMessaging.getToken();
        print('device token : $token');
        await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUserID)
            .update({'pushToken': token});
      } catch (e) {
        Logger().e('Get Msg Tokken Error $e');
      }
    }
    _firebaseMessaging
      ..requestNotificationPermissions(
          const IosNotificationSettings(sound: true, badge: true, alert: true))
      ..onIosSettingsRegistered.listen(
        (settings) {
          print('Settings registered: $settings');
        },
      )
      ..configure(
        onMessage: (message) async {
          print('------FCM onMessage $message');

          final data = message['data'] ?? {};
          final msg = message['notification'] ?? {};
          final groupId = message['groupId'] ?? data['groupId'];
          final isCall = message['isCall'] ?? data['isCall'];

          if (isCall != null) {
            displayIncomingCall();
          } else if (groupId == null && msg != null) {
            await notController.onMessageNotificationReceived(
              senderId: message['senderId'] ?? data['senderId'],
              senderName: message['senderName'] ??
                  data['senderName'] ??
                  data['groupName'],
              message: msg['body'],
            );
          } else {
            await notController.groupMessageNotificationReceived(
              groupId: groupId,
              groupName: message['groupName'] ?? data['groupName'],
              senderName: message['senderName'] ?? data['senderName'],
              message: msg['body'],
            );
          }
        },
        onResume: (message) async {
          print('------FCM onResume $message');
          final senderId = (message['data'] ?? {})['senderId'];
          final groupId = (message['data'] ?? {})['groupId'];
          final isCall = (message['isCall'] ?? {})['isCall'];

          if (isCall != null) {
            displayIncomingCall();
          } else if (senderId != null) {
            await notController.onMessageNotificationOpened(senderId);
          } else if (groupId != null) {
            await notController.groupMessageNotificationOpened(groupId);
          }
        },
        onLaunch: (message) async {
          print('------FCM onLaunch $message');
          final senderId = (message['data'] ?? {})['senderId'];
          final groupId = (message['data'] ?? {})['groupId'];
          final isCall = (message['isCall'] ?? {})['isCall'];

          if (isCall != null) {
            displayIncomingCall();
          } else if (senderId != null) {
            await notController.onMessageNotificationOpened(senderId);
          } else if (groupId != null) {
            await notController.groupMessageNotificationOpened(groupId);
          }
        },
        onBackgroundMessage: Platform.isAndroid ? _onBackgroundMsg : null,
      );
  }
}

Future _onBackgroundMsg(Map<String, dynamic> message) async {
  Logger().i('FCM onBackgroundMessage $message');
  displayIncomingCall();
  return;
}

Future<void> displayIncomingCall() async {
  final callUUID = '0783a8e5-8353-4802-9448-c6211109af51';
  final number = '+46 70 123 45 67';
  await CallKeep.displayIncomingCall(
      callUUID, number, number, HandleType.number, false);
}
