import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class VideoRepository {
  late VlcPlayerController controller;

  Future<VlcPlayerController> initPlayer() async {
    String rtspUrl =
        "rtsp://admin:Sd2023!*@@188.59.119.126:554/cam/realmonitor?channel=1&subtype=0";

    controller = VlcPlayerController.network(
      rtspUrl,
      hwAcc: HwAcc.full,
      autoPlay: true,
    );

    return controller;
  }
}
