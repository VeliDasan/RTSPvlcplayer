/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

Widget buildCameraPlayer({
  required VlcPlayerController controller,
  required String rtspUrl,
  required bool isSelected,
  required Function(String) onTap,
}) {
  return GestureDetector(
    onTap: () => onTap(rtspUrl),

    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey,
          width: 3,
        ),
      ),
      child: VlcPlayer(
        controller: controller,
        aspectRatio: 16 / 9,
        placeholder: Center(child: CircularProgressIndicator()),
      ),
    ),
  );
}*/
