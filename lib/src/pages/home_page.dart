import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/VLCplayerBLoC/vlcplayer_bloc.dart';
import '../blocs/VLCplayerBLoC/vlcplayer_event.dart';
import '../blocs/VLCplayerBLoC/vlcplayer_state.dart';
import '../repositories/video_repository.dart';
import '../widgets/hero.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CameraBloc(CameraRepository()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Kamera Yayını'),
        ),
        body: BlocBuilder<CameraBloc, CameraState>(
          builder: (context, state) {
            final cameraRepository = CameraRepository();

            if (state is CameraSelectedState) {
              final selectedCameraIndex = state.selectedCameraIndex;
              final rtspUrl = cameraRepository.cameras[selectedCameraIndex].rtspUrl;

              return Stack(
                alignment: Alignment.center,
                children: [

                  GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: cameraRepository.cameras.length,
                    itemBuilder: (context, index) {
                      final cameraUrl = cameraRepository.cameras[index].rtspUrl;

                      return HeroCameraWidget(
                        heroTag: 'camera-$index',
                        cameraUrl: cameraUrl,
                        onTap: () {
                          BlocProvider.of<CameraBloc>(context).add(SelectCameraEvent(index));
                        },
                      );
                    },
                  ),


                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: MediaQuery.of(context).size.height / 2,
                    child: HeroCameraWidget(
                      heroTag: 'camera-$selectedCameraIndex',
                      cameraUrl: rtspUrl,
                      isSelected: true,
                      onTap: () {
                        BlocProvider.of<CameraBloc>(context).add(DeselectCameraEvent());
                      },
                    ),
                  ),
                ],
              );
            }

            return GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: cameraRepository.cameras.length,
              itemBuilder: (context, index) {
                final cameraUrl = cameraRepository.cameras[index].rtspUrl;

                return HeroCameraWidget(
                  heroTag: 'camera-$index',
                  cameraUrl: cameraUrl,
                  onTap: () {
                    BlocProvider.of<CameraBloc>(context).add(SelectCameraEvent(index));
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
