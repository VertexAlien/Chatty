import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_messenger/src/modules/call/presentation/video%20call/video_call.dart';
import 'package:flutter_social_messenger/src/modules/call/presentation/voice%20call/voice_call.dart';
import 'package:permission_handler/permission_handler.dart';

import '../data/call_repo.dart';
import '../domain/call.dart';

class PickupScreen extends StatelessWidget {
  final Call call;
  final CallRepo callRepo = CallRepo();

  PickupScreen({
    @required this.call,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Incoming...",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(height: 50),
            CachedNetworkImage(
              imageUrl: call.callerPic,

              // isRound: true,
              // radius: 180,
            ),
            SizedBox(height: 15),
            Text(
              call.callerName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 75),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.call_end,
                    size: 32,
                  ),
                  color: Colors.redAccent,
                  onPressed: () async {
                    await callRepo.endCall(call: call);
                  },
                ),
                SizedBox(width: 64),
                IconButton(
                  icon: Icon(
                    Icons.call,
                    size: 32,
                  ),
                  color: Colors.green,

                  // onPressed: () async =>
                  //     await Permissions.cameraandmicrophonePermissionsGranted()
                  //         ? call.isCall == "video"
                  //             ? Navigator.push(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                   builder: (context) =>
                  //                       VideoCallScreen(call: call),
                  //                 ),
                  //               )
                  //             : Navigator.push(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                   builder: (context) =>
                  //                       VoiceCallScreen(call: call),
                  //                 ),
                  //               )
                  //         : {},
                  onPressed: () async => call.isCall == "video"
                      ? await Permission.camera.request().isGranted &&
                              await Permission.microphone.request().isGranted
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VideoCallScreen(
                                  call: call,
                                ),
                              ),
                            )
                          : {}
                      : await Permission.microphone.request().isGranted
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    VoiceCallScreen(call: call),
                              ),
                            )
                          : {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
