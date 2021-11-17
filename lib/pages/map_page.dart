import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_icons/flutter_icons.dart';
import 'package:snapchat2/theme/colors.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:snapchat/theme/colors.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const _initialCameraPosition = CameraPosition(
      target: LatLng(37.773972, -122.431297),
    zoom: 11.5,
  );

  late GoogleMapController _googleMapController;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }
  // Completer<GoogleMapController> _controller = Completer();
  // static final CameraPosition _currentPosition = CameraPosition(
  //   target: LatLng(11.5760029, 104.845914),
  //   zoom: 14.4746,
  // );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: getFloatingButtons(),
        body: getBody(),
      ),
    );
  }

  // getBody(){
  //   return GoogleMap(
  //     mapType: MapType.normal,
  //     myLocationButtonEnabled: false,
  //     initialCameraPosition: _currentPosition,
  //     onMapCreated: (GoogleMapController controller){
  //       _controller.complete(controller);
  //     },
  //   );
  // }

  getBody(){
    return GoogleMap(
      myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition,
      onMapCreated: (controller) => _googleMapController = controller,
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
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: darkGrey.withOpacity(0.3),
                    spreadRadius: 20,
                    blurRadius: 40),
                ]),
                child: Column(
                  children: [
                    Text("Phnom Penh",style: TextStyle(
                      fontSize: 16,
                      color: white,
                      fontWeight: FontWeight.bold,),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(Icons.cloud, color: white, size: 15),
                        SizedBox(width: 10),
                        Text("25 c",
                        style: TextStyle(fontSize: 13,color: white)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black.withOpacity(0.3)),
                    child: Icon(AntDesign.setting,
                        color: Colors.white, size: 23),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 70,
                height: 80,
                child: Stack(
                  children: [
                    Positioned(
                      left: 3,
                      child: Container(
                        width: 70,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white),
                        child: Center(
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: darkGrey.withOpacity(0.5)),
                            child: Center(
                                child:
                                Icon(Entypo.user,color: darkGrey,size: 30),
                            ),),
                        ),
                      ),
                    ),

                Positioned(
                  bottom: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10,right: 10,bottom: 5,top: 5),
                      child: Text("My Bitmoji",style: TextStyle(fontSize: 11,
                      fontWeight: FontWeight.bold),),
                    ),),
                ),
                  ],
                ),
              ),
              Container(
                width: 35,
                height: 35,
                decoration:
                BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: Center(
                  child: Icon(FontAwesome.location_arrow,size: 20),
                ),
              ),
              Container(
                width: 70,
                height: 80,
                child: Stack(
                  children: [
                    Positioned(
                      left: 3,
                      child: Container(
                        width: 70,
                        height: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white),
                        child: Center(
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: darkGrey.withOpacity(0.5)),
                            child: Center(
                              child:
                              Icon(Entypo.user,color: darkGrey,size: 30),
                            ),),
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 18,right: 18,bottom: 7,top: 5),
                          child: Text("Friends",
                            style: TextStyle(fontSize: 11,
                              fontWeight: FontWeight.bold),),
                        ),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
