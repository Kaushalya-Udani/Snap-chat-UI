import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:snapchat2/data/discover_json.dart';
import 'package:snapchat2/theme/colors.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: getAppBar(),
      body: getBody(),
    );
  }


  getBody(){
    var size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
    bottomRight: Radius.circular(10)),
    color: white.withOpacity(0.9)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              getContact(),
              SizedBox(height: 25),
              getPouplarStar(),
              SizedBox(height: 25),
              getTrendingLenses(),
              SizedBox(height: 25),
              getTvShow(),
            ],
          ),
        ),
      ),
    );
  }

  getTvShow(){
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
            "TV Shows",
        style: TextStyle(
          fontSize: 16,color: black, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: size.width-24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: white,
            boxShadow: [
              BoxShadow(
                  color: darkGrey.withOpacity(0.05),
                  spreadRadius: 2.5,
                  blurRadius: 5),
            ],),
          child: Column(
            children: [
              Column(
                children: List.generate(popular_star_data.length, (index){
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 12,bottom: 5),
                        child: Row(
                          children: [
                            /*profile pic 3 thiyana loku wate containner ek*/
                            Container(
                              width: (size.width - 44),
                              child: Row(children: [
                                SizedBox(width: 5),
                                /*profile pic eka demma circle ek*/
                                Container(
                                  width: 55,
                                  height: 55,
                                  decoration:
                                  BoxDecoration(shape: BoxShape.circle),
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: white,
                                          width: 2,
                                        ),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                popular_show_data[index]['img']),
                                            fit: BoxFit.cover),),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          popular_show_data[index]['name'],
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: black,
                                              fontWeight: FontWeight.w500
                                          ),
                                          overflow: TextOverflow.ellipsis),
                                      SizedBox(height: 5),
                                      Text(
                                        popular_show_data[index]['nickname'],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: darkGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],),
                            ),
                          ],
                        ),
                      ),
                      /* rows wenkarala adura ganna eewa bedanna, medin yana ira*/
                      Divider(
                        thickness: 0.5,
                      ),
                    ],
                  );
                }),),

              /*view more row eka */
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 12),
                child: Text(
                  "View More",
                  style: TextStyle(
                      fontSize: 14, color: black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  getTrendingLenses(){
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Trending Lenses",
              style: TextStyle(
                  fontSize: 16, color: black,fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  "Explore more",
                  style: TextStyle(
                      fontSize: 13,
                      color: black.withOpacity(0.4),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                Icon(Icons.arrow_forward_ios,
                size: 14, color: black.withOpacity(0.4),),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: size.width-24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: white,
            boxShadow: [
              BoxShadow(
                  color: darkGrey.withOpacity(0.05),
                  spreadRadius: 2.5,
                  blurRadius: 5),
            ],),
          child: Column(
            children: [
              Column(
                children: List.generate(popular_star_data.length, (index){
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 12,bottom: 5),
                        child: Row(
                          children: [
                            /*profile pic 3 thiyana loku wate containner ek*/
                            Container(
                              width: (size.width - 44),
                              child: Row(children: [
                                SizedBox(width: 5),
                                /*profile pic eka demma circle ek*/
                                Container(
                                  width: 55,
                                  height: 55,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: black),
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: white,
                                          width: 2,
                                        ),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                trending_lense_data[index]['img']),
                                            fit: BoxFit.cover),),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          trending_lense_data[index]['name'],
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: black,
                                              fontWeight: FontWeight.w500
                                          ),
                                          overflow: TextOverflow.ellipsis),
                                      SizedBox(height: 5),
                                      Text(
                                        trending_lense_data[index]['nickname'],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: darkGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],),
                            ),
                          ],
                        ),
                      ),
                      /* rows wenkarala adura ganna eewa bedanna, medin yana ira*/
                      Divider(
                        thickness: 0.5,
                      ),
                    ],
                  );
                }),),

              /*view more row eka */
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 12),
                child: Text(
                  "View More",
                  style: TextStyle(
                      fontSize: 14, color: black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  getPouplarStar(){
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          "Popular Snap Star",
          style: TextStyle(
              fontSize: 16, color: black,fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: size.width-24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: white,
            boxShadow: [
              BoxShadow(
                  color: darkGrey.withOpacity(0.05),
                  spreadRadius: 2.5,
                  blurRadius: 5),
            ],),
          child: Column(
            children: [
              Column(
                children: List.generate(quick_add_data.length, (index){
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 12,bottom: 5),
                        child: Row(
                          children: [
                            /*profile pic 3 thiyana loku wate containner ek*/
                            Container(
                              width: (size.width - 44) * 0.55,
                              child: Row(children: [
                                SizedBox(width: 5),
                                /*profile pic eka demma circle ek*/
                                Container(
                                  width: 57,
                                  height: 57,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: blue
                                    ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: white,
                                          width: 2,
                                        ),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                popular_star_data[index]['img']),
                                            fit: BoxFit.cover),),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          popular_star_data[index]['name'],
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: black,
                                              fontWeight: FontWeight.w500
                                          ),
                                          overflow: TextOverflow.ellipsis),
                                      SizedBox(height: 5),
                                      Text(
                                        popular_star_data[index]['nickname'],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: black.withOpacity(0.4),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],),
                            ),
                            Container(
                              width: (size.width - 44) * 0.45,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [

                                  /*user add karanna hadana container eka +"Add" */
                                  Container(
                                    decoration: BoxDecoration(
                                      color: darkGrey.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15,right: 15,bottom: 8,top: 8),
                                      child: Row(
                                        children: [
                                          Icon(AntDesign.like2, size: 14),
                                          SizedBox(width: 6,),
                                          Text(
                                            "Subscribe",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: black,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      /* rows wenkarala adura ganna eewa bedanna, medin yana ira*/
                      Divider(
                        thickness: 0.5,
                      ),
                    ],
                  );
                }),),

              /*view more row eka */
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 12),
                child: Text(
                  "View More",
                  style: TextStyle(
                      fontSize: 14, color: black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  getContact(){
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          "Quick Add",
        style: TextStyle(
          fontSize: 16, color: black,fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: size.width-24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: white,
            boxShadow: [
              BoxShadow(
                color: darkGrey.withOpacity(0.05),
                spreadRadius: 2.5,
                blurRadius: 5),
            ],),
          child: Column(
            children: [
              Column(
                children: List.generate(quick_add_data.length, (index){
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 12,bottom: 5),
                        child: Row(
                          children: [
                            /*profile pic 3 thiyana loku wate containner ek*/
                            Container(
                              width: (size.width - 44) * 0.65,
                              child: Row(children: [
                                SizedBox(width: 5),
                                /*profile pic eka demma circle ek*/
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        quick_add_data[index]['img']),
                                      fit: BoxFit.cover),),
                                ),
                                SizedBox(width: 10),
                                Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(quick_add_data[index]['name'],
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: black,
                                              fontWeight: FontWeight.w500
                                            ),
                                            overflow: TextOverflow.ellipsis),
                                        SizedBox(height: 5),
                                        Text(quick_add_data[index]['nickname'],
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: black.withOpacity(0.4),
                                            ),
                                        ),
                                      ],
                                    ),
                                ),
                              ],),
                            ),
                            Container(
                              width: (size.width - 44) * 0.35,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                                  /*user add karanna hadana container eka +"Add" */
                                  Container(
                                    decoration: BoxDecoration(
                                      color: darkGrey.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15,right: 15,bottom: 8,top: 8),
                                      child: Row(
                                        children: [
                                          Icon(Feather.user_plus, size: 14),
                                          SizedBox(width: 6,),
                                          Text(
                                            "Add",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: black,
                                              fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.close,
                                  color: darkGrey.withOpacity(0.7),size: 16),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      /* rows wenkarala adura ganna eewa bedanna, medin yana ira*/
                      Divider(
                        thickness: 0.5,
                      ),
                    ],
                  );
                }),),

              /*view more row eka */
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 12),
                child: Text(
                  "View More",
                  style: TextStyle(
                  fontSize: 14, color: black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.1)),
                child: Icon(Icons.supervised_user_circle_sharp,
                    color: primary, size: 28),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.1)),
                child: Icon(Icons.search_rounded, color: darkGrey, size: 23),
              ),
            ],
          ),
          Text(
            "Discover",
            style: TextStyle(
                fontSize: 18, color: black, fontWeight: FontWeight.bold),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.1)),
            child: Icon(Feather.user_plus, color: darkGrey, size: 20),
          ),
        ],
      ),
    );
  }
}
