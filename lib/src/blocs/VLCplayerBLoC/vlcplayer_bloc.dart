import 'package:dahua_rtsp_vlc_player/src/blocs/VLCplayerBLoC/vlcplayer_event.dart';
import 'package:dahua_rtsp_vlc_player/src/blocs/VLCplayerBLoC/vlcplayer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/video_repository.dart';

class VlcplayerBloc extends Bloc<VlcplayerEvent, VlcplayerState> {
  final VideoRepository videoRepository;

  VlcplayerBloc({required this.videoRepository}) : super(VideoLoadingState()) {
    on<FetchVideoStream>(_onFetchVideo);
  }

  Future<void> _onFetchVideo(
      FetchVideoStream event, Emitter<VlcplayerState> emit) async {
    try {
      final controller = await videoRepository.initPlayer();
      emit(VideoPlayingState(controller: controller));
    } catch (error) {
      emit(VideoErrorState(error: error.toString()));
    }
  }
}
