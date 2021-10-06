import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_social_messenger/src/modules/call/presentation/video%20call/video_call.dart';

import '../../auth/domain/entities/user.dart';
import '../data/call_repo.dart';
import '../domain/call.dart';
import 'voice call/voice_call.dart';

class CallController {
  final callRepo = CallRepo();

  dialVideo({User from, User to, context, String callis}) async {
    var call = Call(
      callerId: from.id,
      callerName: from.name,
      callerPic: from.photoUrl,
      receiverId: to.id,
      receiverName: to.name,
      receiverPic: to.photoUrl,
      isCall: callis,
      channelId: Random().nextInt(10000).toString(),
    );

    var callMade = await callRepo.makeVideoCall(call: call);

    call.hasDialled = true;

    if (callMade) {
      print('Video call started!');

      /// route to video call screen
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => VideoCallScreen(call: call),
      //     ));

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoCallScreen(
              call: call,
            ),
          ));
    }
  }

  dialVoice({User from, User to, context, String callis}) async {
    var call = Call(
      callerId: from.id,
      callerName: from.name,
      callerPic: from.photoUrl,
      receiverId: to.id,
      receiverName: to.name,
      receiverPic: to.photoUrl,
      isCall: callis,
      channelId: Random().nextInt(10000).toString(),
    );

    var callMade = await callRepo.makeVoiceCall(call: call);

    call.hasDialled = true;

    if (callMade) {
      print('Voice call started!');

      /// route to video call screen
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VoiceCallScreen(call: call),
          ));
    }
  }
}
