import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whats_app_clone/core/globle.dart';
import 'package:whats_app_clone/features/camera_filters/presentation/screnns/camera_filter_screen.dart';

class CameraPage extends StatefulWidget {
  final Function tikerForword;
  final Function tikerReverse;
  const CameraPage(this.tikerForword, this.tikerReverse) : super();

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _cameraController;
  late Future<void> cameraValue;
  bool isRecording = false;
  int index = 0;

  void _clickFlash() {
    setState(() {
      switch (index) {
        case 0:
          _cameraController!.setFlashMode(FlashMode.torch);
          ++index;
          break;
        case 1:
          _cameraController!.setFlashMode(FlashMode.auto);
          ++index;
          break;
        case 2:
          _cameraController!.setFlashMode(FlashMode.off);
          index = 0;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    widget.tikerForword();
    _cameraController = CameraController(cameras![0], ResolutionPreset.high);
    _cameraController!.setFlashMode(FlashMode.off);
    cameraValue =
        _cameraController!.initialize().then((value) => setState(() {}));
  }

  void takePhoto() async {
    //   final path = getTempararyDirectory();
    XFile path = await _cameraController!.takePicture();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => CameraFilterScreen(
              path: path.path,
            )));
  }

  @override
  void dispose() {
    widget.tikerReverse();
    super.dispose();
    _cameraController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<IconButton> _flashBtnList = [
      IconButton(
          onPressed: _clickFlash,
          icon: Icon(
            Icons.flash_off,
            size: 28,
            color: Colors.white,
          )),
      IconButton(
          onPressed: _clickFlash,
          icon: Icon(
            Icons.flash_on,
            size: 28,
            color: Colors.white,
          )),
      IconButton(
          onPressed: _clickFlash,
          icon: Icon(
            Icons.flash_auto,
            size: 28,
            color: Colors.white,
          )),
    ];

    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                      height: MediaQuery.of(context).size.height,
                      child: CameraPreview(_cameraController!));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _flashBtnList[index],
                      GestureDetector(
                        onLongPress: () async {
                          if (!_cameraController!.value.isRecordingVideo)
                            await _cameraController!.startVideoRecording();
                          setState(() {
                            isRecording = true;
                          });
                        },
                        // onLongPressUp: () async {
                        //   if (_cameraController!.value.isRecordingVideo) {
                        //     XFile path =
                        //         await _cameraController!.stopVideoRecording();
                        //     print(path.path);
                        //   }

                        //   setState(() {
                        //     isRecording = false;
                        //   });
                        // },
                        onTap: () async {
                          if (!isRecording) takePhoto();
                           if (_cameraController!.value.isRecordingVideo) {
                            XFile path =
                                await _cameraController!.stopVideoRecording();
                            print(path.path);
                          }

                          setState(() {
                            isRecording = false;
                          });
                        },
                        child: isRecording
                            ? Icon(
                                Icons.radio_button_on,
                                size: 70,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.panorama_fish_eye,
                                size: 70,
                                color: Colors.white,
                              ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.flip_camera_ios,
                          size: 28,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Container(
                    color: Colors.black,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text(
                        'Hold for video, tap for photo',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
