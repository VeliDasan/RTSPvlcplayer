import 'package:equatable/equatable.dart';

abstract class VlcplayerEvent extends Equatable {
  const VlcplayerEvent();
}

class FetchVideoStream extends VlcplayerEvent {
  @override
  List<Object> get props => [];
}

