import 'package:dahua_rtsp_vlc_player/src/blocs/VLCplayerBLoC/vlcplayer_bloc.dart';
import 'package:dahua_rtsp_vlc_player/src/blocs/VLCplayerBLoC/vlcplayer_event.dart';
import 'package:dahua_rtsp_vlc_player/src/blocs/VLCplayerBLoC/vlcplayer_state.dart';
import 'package:dahua_rtsp_vlc_player/src/repositories/video_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class VlcPlayerScreen extends StatelessWidget {
  final VideoRepository videoRepository = VideoRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VlcplayerBloc(videoRepository: videoRepository)
        ..add(FetchVideoStream()),
      child: Scaffold(
        appBar: AppBar(title: const Text('VLC Player')),
        body: BlocConsumer<VlcplayerBloc, VlcplayerState>(
          listener: (context, state) {
            if (state is VideoErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.error}')),
              );
            }
          },
          builder: (context, state) {
            if (state is VideoPlayingState) {
              return Center(
                  child: VlcPlayer(
                controller: state.controller,
                aspectRatio: 16 / 9,
              ));
            } else {
              return const Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }
}
