import 'dart:async';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:flutter/material.dart';

import '../../data/call_repo.dart';
import '../../domain/call.dart';

class VideoCallScreen extends StatefulWidget {
  final Call call;

  VideoCallScreen({@required this.call});

  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  bool _joined = false;
  int _remoteUid;
  bool _switch = false;
  bool mutedMic = false;
  bool disableVideo = false;
  RtcEngine engine;

  final callRepo = CallRepo();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Initialize the app
  Future<void> initPlatformState() async {
    // Create RTC client instance
    engine = await RtcEngine.create(callRepo.APP_ID);
    // Define event handling
    engine.setEventHandler(RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
      print('joinChannelSuccess ${channel} ${uid}');
      setState(() {
        _joined = true;
      });
    }, userJoined: (int uid, int elapsed) {
      print('userJoined ${uid}');
      setState(() {
        _remoteUid = uid;
        _switch = true;
      });
    }, userOffline: (int uid, UserOfflineReason reason) {
      print('userOffline ${uid}');
      setState(() {
        _remoteUid = null;
        Navigator.pop(context);
      });
    }));
    // Enable video
    await engine.enableVideo();
    // Join channel 123
    await engine.joinChannel(null, widget.call.channelId, null, 0);
  }

  /// Top Toolbar layout
  Widget _topToolbar() {
    return Container(
      alignment: Alignment.topRight,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          RawMaterialButton(
            onPressed: _onSwitchCamera,
            child: Icon(
              Icons.switch_camera,
              color: Colors.blueAccent,
              size: 22.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(12.0),
          )
        ],
      ),
    );
  }

  /// Bottom Toolbar layout
  Widget _bottomToolbar() {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: _onMicMute,
            child: Icon(
              mutedMic ? Icons.mic_off : Icons.mic,
              color: mutedMic ? Colors.white : Colors.blueAccent,
              size: 22.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: mutedMic ? Colors.blueAccent : Colors.white,
            padding: const EdgeInsets.all(12.0),
          ),
          RawMaterialButton(
            onPressed: () => callRepo.endCall(
              call: widget.call,
              context: context,
            ),
            child: Icon(
              Icons.call_end,
              color: Colors.white,
              size: 36.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.redAccent,
            padding: const EdgeInsets.all(15.0),
          ),
          RawMaterialButton(
            onPressed: _onDisableVideo,
            child: Icon(
              disableVideo ? Icons.videocam_off : Icons.videocam,
              color: disableVideo ? Colors.white : Colors.blueAccent,
              size: 22.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: disableVideo ? Colors.blueAccent : Colors.white,
            padding: const EdgeInsets.all(12.0),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // destroy sdk
    engine.leaveChannel();
    engine.destroy();

    super.dispose();
  }

  void _onMicMute() {
    setState(() {
      mutedMic = !mutedMic;
    });
    engine.muteLocalAudioStream(mutedMic);
  }

  void _onSwitchCamera() {
    engine.switchCamera();
  }

  void _onDisableVideo() {
    setState(() {
      disableVideo = !disableVideo;
    });
    if (disableVideo == false) {
      engine.enableVideo();
    } else {
      engine.disableVideo();
    }
  }

  // Create UI with local view and remote view
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Center(
                child: _switch ? _renderRemoteVideo() : _renderLocalPreview(),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.transparent,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _switch = !_switch;
                      });
                    },
                    child: Center(
                      child: _switch
                          ? _renderLocalPreview()
                          : _renderRemoteVideo(),
                    ),
                  ),
                ),
              ),
              _topToolbar(),
              _bottomToolbar(),
            ],
          ),
        ),
      ),
    );
  }

  // Generate local preview
  Widget _renderLocalPreview() {
    if (_joined) {
      return RtcLocalView.SurfaceView();
    } else {
      return Text(
        'Connecting...',
        textAlign: TextAlign.center,
      );
    }
  }

  // Generate remote preview
  Widget _renderRemoteVideo() {
    if (_remoteUid != null) {
      return RtcRemoteView.SurfaceView(uid: _remoteUid);
    } else {
      return Text(
        'Calling...',
        textAlign: TextAlign.center,
      );
    }
  }
}
