import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:zoom_clone/resources/auth_method.dart';
import 'package:zoom_clone/resources/firestore_methods.dart';

class JitsiMeetMethod {
  final AuthMethod _authMethod = AuthMethod();
  final FirestoreMethods _fireStoreMethods = FirestoreMethods();

  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    String name;
    if (username.isEmpty) {
      name = _authMethod.user.displayName!;
    } else {
      name = username;
    }
    try {
      await JitsiMeetWrapper.joinMeeting(
        options: JitsiMeetingOptions(
            roomNameOrUrl: roomName,
            userDisplayName: name,
            userEmail: _authMethod.user.email,
            userAvatarUrl: _authMethod.user.photoURL,
            isAudioMuted: isAudioMuted,
            isVideoMuted: isVideoMuted),
        listener: JitsiMeetingListener(
          onConferenceWillJoin: (url) =>
              print("onConferenceWillJoin: url: $url"),
          onConferenceJoined: (url) => print("onConferenceJoined: url: $url"),
          onConferenceTerminated: (url, error) =>
              print("onConferenceTerminated: url: $url, error: $error"),
        ),
      );
      _fireStoreMethods.addToMeetingHistory(roomName);
    } catch (e) {
      print(e.toString());
    }
  }
}
