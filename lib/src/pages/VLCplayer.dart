import 'package:dahua_rtsp_vlc_player/src/blocs/VLCplayerBLoC/vlcplayer_bloc.dart';
import 'package:dahua_rtsp_vlc_player/src/blocs/VLCplayerBLoC/vlcplayer_event.dart';
import 'package:dahua_rtsp_vlc_player/src/blocs/VLCplayerBLoC/vlcplayer_state.dart';
import 'package:dahua_rtsp_vlc_player/src/repositories/video_repository.dart';
import 'package:dahua_rtsp_vlc_player/src/widgets/buildCameraPlayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              return GridView.count(
                crossAxisCount: 2,
                children: List.generate(state.controller.length, (index) {
                  return buildCameraPlayer(state.controller[index]);
                }),
              );
            } else {
              return const Center(child: Text('Unknown state'));
            }
          },
        ),
      ),
    );
  }
}
