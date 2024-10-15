import 'package:equatable/equatable.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

abstract class VlcplayerState extends Equatable {
  @override
  List<Object> get props => [];
}

class VideoLoadingState extends VlcplayerState {}

class VideoPlayingState extends VlcplayerState {
  final List<VlcPlayerController>  controller;

  VideoPlayingState({required this.controller});

  @override
  List<Object> get props => [controller];
}

class VideoErrorState extends VlcplayerState {
  final String error;

  VideoErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
