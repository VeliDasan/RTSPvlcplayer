
import '../models/CameraModel.dart';


class CameraRepository {
  final List<CameraModel> cameras = [
    CameraModel("rtsp:..."),
    CameraModel("rtsp:..."),
    CameraModel("rtsp:..."),
    CameraModel("rtsp:..."),
  ];

  List<CameraModel> getCameras() {
    return cameras;
  }
}
