import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class VideoRepository {
  late List<VlcPlayerController> controller;

  Future<List<String>> getRTSPDataSet() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      return [
        "rtsp://admin:Sd2023!*@@5.11.188.120/cam/realmonitor?channel=1&subtype=1",
        "rtsp://admin:Sd2023!*@@5.11.188.120/cam/realmonitor?channel=2&subtype=1",
        "rtsp://admin:Sd2023!*@@5.11.188.120/cam/realmonitor?channel=1&subtype=1",
        "rtsp://admin:Sd2023!*@@5.11.188.120/cam/realmonitor?channel=1&subtype=1",
      ];
    } catch (e) {
      return [];
    }
  }

  initPlayer() async {
    List<String> rtspUrls = await getRTSPDataSet();
    controller = rtspUrls.map((url) {
      return VlcPlayerController.network(
        url,
        hwAcc: HwAcc.full,
        autoPlay: true,
      );
    }).toList();
    return controller;
  }
}
