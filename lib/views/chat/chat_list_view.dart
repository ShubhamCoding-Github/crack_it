import 'package:crack_it_user/utils/base_widgets/base_app_bar.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:crack_it_user/utils/constants/base_images.dart';
import 'package:crack_it_user/views/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: "Chat",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 100),
          child: Column(
              children: List.generate(6, (index) {
            return baseChatCard(
              index: index,
            );
          })),
        ),
      ),
    );
  }
}

class baseChatCard extends StatelessWidget {
  const baseChatCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const ChatScreen());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: borderGrayColor),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  manIc1,
                  width: 60,
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jaxen C",
                      style: TextStyle(
                          fontSize: 20,
                          color: blackColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        "My progress getting better. Thank you",
                        style: TextStyle(fontSize: 14, color: textGrayColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Row(
              children: [
                Column(
                  children: [
                    Text(
                      "11:20 AM",
                      style: TextStyle(
                          //fontSize: 22,
                          color: textGrayColor,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
