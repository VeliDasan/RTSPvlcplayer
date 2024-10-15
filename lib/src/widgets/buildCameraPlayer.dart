import 'package:flutter/cupertino.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

Widget buildCameraPlayer(VlcPlayerController controller) {
  return Padding(
    padding: const EdgeInsets.all(1.0),
    child: VlcPlayer(
      controller: controller,
      aspectRatio: 16 / 9,
    ),
  );
}