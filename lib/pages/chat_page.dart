import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:snapchat2/data/chat_json.dart';
import 'package:snapchat2/theme/colors.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  getBody() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          color: white),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Flexible(
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(color: darkGrey.withOpacity(0.2)),
                ),
              ),
              SizedBox(width: 10),
              Text(
                "Quick Add",
                style: TextStyle(color: blue),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Container(
                  height: 1,
                  decoration: BoxDecoration(color: darkGrey.withOpacity(0.2)),
                ),
              ),
            ]),
            SizedBox(height: 15),

            /* body ekee okkoma deewal danne methana */

            Column(
              children: List.generate(chat_data.length, (index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (size.width - 40) * 0.68,
                            child: Row(
                              children: [
                                /*profilepic eka thiyana container eka meeka*/
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          chat_data[index]['img'],
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  width: (size.width - 90) * 0.3,
                                  /*profile pic ekata ehain thiyana text container ek hada gannwa
                              colum ekak ethulata daala*/
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        chat_data[index]['name'],
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: black,
                                            fontWeight: FontWeight.w400),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        chat_data[index]['nickname'],
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: black.withOpacity(0.5),
                                            fontWeight: FontWeight.w400),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "NEW CONTACT",
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: black.withOpacity(0.5),
                                            fontWeight: FontWeight.w400),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: (size.width - 40) * 0.32,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: blue),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 12, left: 12, bottom: 4, top: 4),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.add,
                                          size: 18,
                                          color: blue,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Add",
                                          style: TextStyle(color: blue),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Icon(
                                  AntDesign.close,
                                  size: 16,
                                  color: darkGrey.withOpacity(0.7),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Divider()
                  ],
                );
              }),
            ),
          ],
        ),
      ),
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
            "Chat",
            style: TextStyle(
                fontSize: 18, color: black, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.1)),
                child: Icon(Feather.user_plus, color: darkGrey, size: 28),
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
                child: Icon(AntDesign.edit, color: darkGrey, size: 23),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
