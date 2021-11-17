import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:snapchat2/theme/colors.dart';


class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late List<CameraDescription> _cameras;
  late CameraController _controller;
  bool _isReady = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setupCamera();
  }
  _setupCamera() async {
    try {
      _cameras = await availableCameras();
      _controller = CameraController(
        _cameras[0],
        ResolutionPreset.medium
      );
      await _controller.initialize();
    } catch(_){

    }
    if(!mounted) return;
    setState(() {
      _isReady = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: getFloatingButtons(),
      body: getBody(),
    );
  }

  cameraPreview(){
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
        child: CameraPreview(_controller));
  }

  getBody(){
    var size = MediaQuery.of(context).size;
    if(_isReady == false || _controller == null || !_controller.value.isInitialized){
      return Container(
        width: size.width,
        height: size.height,
        child: Center(
          child: SizedBox(
            width: 25,
            height: 25,
            child: CircularProgressIndicator(strokeWidth: 3),
          ),
        ),
      );
    }
    return Container(
      width: size.width,
      height: size.height,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      child: cameraPreview()),
    );
  }

  getFloatingButtons(){
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black.withOpacity(0.3)),
                    child: Icon(Icons.supervised_user_circle_sharp,
                        color: primary, size: 28),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black.withOpacity(0.3)),
                    child: Icon(Icons.search_rounded,
                        color: Colors.white, size: 23),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black.withOpacity(0.3)),
                    child: Icon(Icons.supervised_user_circle_outlined,
                        color: Colors.white, size: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black.withOpacity(0.3)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Icon(SimpleLineIcons.refresh, color: white, size: 25),
                          SizedBox(
                            height: 18,
                          ),
                          Icon(Entypo.flash, color: white, size: 25),
                          SizedBox(
                            height: 18,
                          ),
                          Icon(MaterialCommunityIcons.play_box_outline,
                              color: white, size: 25),
                          SizedBox(
                            height: 18,
                          ),
                          Icon(Entypo.beamed_note, color: white, size: 25),
                          SizedBox(
                            height: 18,
                          ),
                          Icon(Ionicons.ios_arrow_down, color: white, size: 25),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: null,
                icon: Icon(MaterialCommunityIcons.cards_playing_outline,
                color: white, size: 28),
              ),
              SizedBox(width: 15),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 7, color: Colors.white),
                ),
              ),
              SizedBox(width: 15),
              IconButton(
                onPressed: null,
                icon: Icon(Entypo.emoji_happy,
                    color: white, size: 28),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
