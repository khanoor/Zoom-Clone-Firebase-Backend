import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/jitsi_meeting_method.dart';
import 'package:zoom_clone/widgets/home_meeting_button.dart';

class MeetingScreen extends StatefulWidget {
  MeetingScreen({super.key});
  final JitsiMeetMethod _jitsiMeetMethod = JitsiMeetMethod();

  createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(1000000) + 10000000).toString();
    _jitsiMeetMethod.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
                onPressed: widget.createNewMeeting,
                icon: Icons.videocam,
                text: "New Meeting"),
            HomeMeetingButton(
                onPressed: () => widget.joinMeeting(context),
                icon: Icons.add_box_rounded,
                text: "Join Meeting"),
            HomeMeetingButton(
                onPressed: () {}, icon: Icons.calendar_today, text: "Schedule"),
            HomeMeetingButton(
                onPressed: () {},
                icon: Icons.arrow_upward_rounded,
                text: "Share Screen"),
          ],
        ),
        const Expanded(
            child: Center(
          child: Text('Create/Join Meetings with just one click!'),
        ))
      ],
    );
  }
}
