
import '../models/CameraModel.dart';


class CameraRepository {
  final List<CameraModel> cameras = [
    CameraModel("rtsp://admin:Sd2023!*@@188.59.119.126:554/cam/realmonitor?channel=2&subtype=1"),
    CameraModel("rtsp://admin:Sd2023!*@@188.59.119.126:554/cam/realmonitor?channel=1&subtype=1"),
    CameraModel("rtsp://admin:Sd2023!*@@188.59.119.126:554/cam/realmonitor?channel=1&subtype=1"),
    CameraModel("rtsp://admin:Sd2023!*@@188.59.119.126:554/cam/realmonitor?channel=1&subtype=1"),
  ];

  List<CameraModel> getCameras() {
    return cameras;
  }
}
