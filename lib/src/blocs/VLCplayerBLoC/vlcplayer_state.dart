// lib/blocs/camera_state.dart
abstract class CameraState {}

class CameraInitialState extends CameraState {}

class CameraSelectedState extends CameraState {
  final int selectedCameraIndex;

  CameraSelectedState(this.selectedCameraIndex);
}
