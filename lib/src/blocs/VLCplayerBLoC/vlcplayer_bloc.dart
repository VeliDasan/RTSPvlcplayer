// lib/blocs/camera_bloc.dart
import 'package:dahua_rtsp_vlc_player/src/blocs/VLCplayerBLoC/vlcplayer_event.dart';
import 'package:dahua_rtsp_vlc_player/src/blocs/VLCplayerBLoC/vlcplayer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/video_repository.dart';


class CameraBloc extends Bloc<CameraEvent, CameraState> {
  final CameraRepository cameraRepository;

  CameraBloc(this.cameraRepository) : super(CameraInitialState()) {

    on<SelectCameraEvent>((event, emit) {
      emit(CameraSelectedState(event.cameraIndex));
    });


    on<DeselectCameraEvent>((event, emit) {
      emit(CameraInitialState());
    });
  }
}
