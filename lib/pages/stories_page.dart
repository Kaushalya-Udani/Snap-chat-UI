import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:snapchat2/data/stories_json.dart';
import 'package:snapchat2/pages/story_detail_page.dart';
import 'package:snapchat2/theme/colors.dart';

class StoriesPage extends StatefulWidget {
  @override
  _StoriesPageState createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10)),),

      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
              child: Text(
                "For You",
                style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(stories_data.length, (index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          PageTransition(
                            child: StoryDetailPage(
                            videoUrl: stories_data[index]['videoUrl'],
                            ),
                            type: PageTransitionType.scale,
                            alignment: Alignment.bottomCenter),);
                    },
                    child: Container(
                      width: (size.width-30)/2,
                      height: 250,
                      child: Stack(
                        children: [
                          Container(
                            width: (size.width - 30) / 2,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(stories_data[index]['img']),
                                  fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: (size.width - 15) / 2,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(0.25),
                                  Colors.black.withOpacity(0),
                                ],
                                end: Alignment.topCenter,
                                begin: Alignment.bottomCenter,),),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(stories_data[index]['name'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,bottom: 10,top: 5),
                                  child: Text(stories_data[index]['date'],
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.7),
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

   getAppBar(){
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
                  shape: BoxShape.circle, color: Colors.black.withOpacity(0.1)),
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
                    shape: BoxShape.circle, color: Colors.black.withOpacity(0.1)),
                child: Icon(Icons.search_rounded,
                    color: darkGrey, size: 23),
              ),
            ],
          ),
          Text("Stories", style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black.withOpacity(0.1)),
                child: Icon(Icons.supervised_user_circle,
                    color: darkGrey, size: 20),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black.withOpacity(0.1)),
                child: Icon(Icons.more_horiz,
                    color: darkGrey, size: 23),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
