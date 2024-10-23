
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class HeroCameraWidget extends StatelessWidget {
  final String heroTag;
  final String cameraUrl;
  final VoidCallback onTap;
  final bool isSelected;

  HeroCameraWidget({
    required this.heroTag,
    required this.cameraUrl,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: heroTag,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.red : Colors.white,
              width: 1.0,
            ),
          ),
          child: VlcPlayer(
            controller: VlcPlayerController.network(
              cameraUrl,
              options: VlcPlayerOptions(),
            ),
            aspectRatio: 16 / 9,
          ),
        ),
      ),
    );
  }
}
