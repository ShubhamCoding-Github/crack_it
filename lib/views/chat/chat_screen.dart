import 'package:crack_it_user/utils/base_widgets/base_app_bar.dart';
import 'package:crack_it_user/utils/base_widgets/base_text.dart';
import 'package:crack_it_user/utils/base_widgets/base_text_field.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:crack_it_user/utils/constants/base_sizes.dart';
import 'package:crack_it_user/views/Experts/rating_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Map<String, dynamic>> chatList = [
    {
      "msg": "Good morning Mr. Pannacota, how can I help you today?",
      "type": "0",
      "date": "8:32 AM"
    },
    {"msg": "Morning Mr. Lukas!", "type": "1", "date": "8:32 AM"},
    {
      "msg":
          "It is a long established fact that a reader will be distracted by the readable content...",
      "type": "0",
      "date": "8:32 AM"
    },
    {
      "msg": "I don't think I have that kind of things before",
      "type": "1",
      "date": "8:32 AM"
    },
    {
      "msg": "Good morning Mr. Pannacota, how can I help you today?",
      "type": "0",
      "date": "8:32 AM"
    },
    {"msg": "Morning Mr. Lukas!", "type": "1", "date": "8:32 AM"},
    {
      "msg":
          "It is a long established fact that a reader will be distracted by the readable content...",
      "type": "0",
      "date": "8:32 AM"
    },
    {
      "msg": "I don't think I have that kind of things before",
      "type": "1",
      "date": "8:32 AM"
    },
    {
      "msg": "Good morning Mr. Pannacota, how can I help you today?",
      "type": "0",
      "date": "8:32 AM"
    },
    {"msg": "Morning Mr. Lukas!", "type": "1", "date": "8:32 AM"},
    {
      "msg":
          "It is a long established fact that a reader will be distracted by the readable content...",
      "type": "0",
      "date": "8:32 AM"
    },
    {
      "msg": "I don't think I have that kind of things before",
      "type": "1",
      "date": "8:32 AM"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        isNotificationVisible: false,
        customtitle: Row(
          children: [
            SvgPicture.asset('assets/delete/Group 274.svg'),
            const SizedBox(
              width: 15.0,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseText(
                  'Jaxen C',
                  fontSize: fs17,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 5.0,
                ),
                BaseText(
                  'Databases Expert',
                  fontSize: fs13,
                  color: textLightGrayColor,
                  fontWeight: FontWeight.w500,
                ),
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          const Divider(
            color: dividerColor,
            thickness: 2.0,
          ),
          const SizedBox(
            height: 35.0,
          ),
          const BaseText(
            'September 15, 2022',
            fontSize: fs12,
            color: greyColor,
          ),
          Expanded(
            child: ListView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              shrinkWrap: true,
              itemCount: chatList.length,
              itemBuilder: (context, index) => chatList[index]['type'] == '0'
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              constraints:
                                  const BoxConstraints(maxWidth: 335.0),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(15.0),
                                    topLeft: Radius.circular(15.0),
                                    topRight: Radius.circular(15.0)),
                                color: greyChatColor,
                              ),
                              padding: const EdgeInsets.all(16.0),
                              child: addTextLeft(chatList[index]['msg'], fs14,
                                  Colors.black, FontWeight.w400),
                            ),
                          ),
                        ),
                        const BaseText(
                          '10:08 Pm',
                          color: greyColor,
                          fontSize: fs12,
                        )
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              constraints:
                                  const BoxConstraints(maxWidth: 335.0),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15.0),
                                    topLeft: Radius.circular(15.0),
                                    topRight: Radius.circular(15.0)),
                                color: primaryColor,
                              ),
                              padding: const EdgeInsets.all(16.0),
                              child: addTextLeft(chatList[index]['msg'], fs14,
                                  Colors.white, FontWeight.w400),
                            ),
                          ),
                        ),
                        const BaseText(
                          '10:08 Pm',
                          color: greyColor,
                          fontSize: fs12,
                        )
                      ],
                    ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, -3),
                  blurRadius: 5.0)
            ]),
            height: 100.0,
            child: Row(
              children: [
                Container(
                  height: 50.0,
                  width: 50.0,
                  padding: const EdgeInsets.all(14.0),
                  decoration: const BoxDecoration(
                      color: greyChatColor, shape: BoxShape.circle),
                  child: SvgPicture.asset('assets/icons/add.svg'),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Container(
                  height: 50.0,
                  width: 50.0,
                  padding: const EdgeInsets.all(14.0),
                  decoration: const BoxDecoration(
                      color: greyChatColor, shape: BoxShape.circle),
                  child: SvgPicture.asset('assets/icons/mic.svg'),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: BaseTextField(
                    hintText: 'Say something',
                    fillColor: greyChatColor,
                    radius: 25.0,
                    suffix: IconButton(
                        onPressed: () {
                          print('object');
                          Get.to(() => RatingScreen());
                        },
                        icon: SvgPicture.asset('assets/icons/send.svg')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar:
    );
  }
}
