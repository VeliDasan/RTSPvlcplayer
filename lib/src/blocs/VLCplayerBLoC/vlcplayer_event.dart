// lib/blocs/camera_event.dart
import 'package:equatable/equatable.dart';

abstract class CameraEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SelectCameraEvent extends CameraEvent {
  final int cameraIndex;

  SelectCameraEvent(this.cameraIndex);

  @override
  List<Object?> get props => [cameraIndex];
}

class DeselectCameraEvent extends CameraEvent {}
