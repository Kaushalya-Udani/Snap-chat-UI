import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:video_player/video_player.dart';



class StoryDetailPage extends StatefulWidget {
  final String videoUrl;

  const StoryDetailPage({ Key ?key, required this.videoUrl}) : super(key: key);
  @override
  _StoryDetailPageState createState() => _StoryDetailPageState();
}

class _StoryDetailPageState extends State<StoryDetailPage> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = VideoPlayerController.asset(widget.videoUrl);
    _controller.addListener((){
      setState(() {});
    });
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  getBody(){
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: VideoPlayer(_controller),
            ),
          ),
      Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0),
            ],
            end: Alignment.topCenter,
            begin: Alignment.bottomCenter),),
      ),
          Padding(
              padding: const EdgeInsets.only(right: 15, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(MaterialIcons.keyboard_arrow_up,
                      color: Colors.white, size: 28),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 12, right: 12, bottom: 8, top: 8),
                        child: Text(
                          "View More Episodes",
                          style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.2),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Center(
                    child: Icon(FontAwesome.location_arrow,size: 20,color: Colors.white,),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getAppBar(){
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(Icons.close),
      ),
      actions: [
        IconButton(
          onPressed: (){},
          icon: Icon(AntDesign.like2, size: 20,),
        ),
        IconButton(
          onPressed: (){},
          icon: Icon(Entypo.dots_three_vertical, size: 20,),
        ),
      ],
    );
  }
}
