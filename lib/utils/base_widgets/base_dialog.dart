import 'package:crack_it_user/storage/base_shared_preference.dart';
import 'package:crack_it_user/utils/base_widgets/base_button.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:crack_it_user/utils/constants/base_images.dart';
import 'package:crack_it_user/utils/constants/base_sizes.dart';
import 'package:crack_it_user/views/auth/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 32.0),
                SvgPicture.asset(paymentSuccessIc),
                const SizedBox(height: 32.0),
                const Text(
                  "Your Booking Payment Has Been Done",
                  style: TextStyle(fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32.0),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}

void showLogoutAccountDialogue(BuildContext context) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              insetPadding: const EdgeInsets.symmetric(horizontal: 55.0),
              child: StatefulBuilder(builder: (context, setSta) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width,
                  // padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            SvgPicture.asset(warningIc),
                            const SizedBox(height: 25.0),
                            const Text(
                              "Are you sure you want to logout this account?",
                              style: TextStyle(fontSize: 23.0),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: 80,
                                    height: 34,
                                    child: BaseButtonWithoutBackground(
                                      onTap: () {
                                        Get.back();
                                      },
                                      title: "No",
                                      btnColor: whiteColor,
                                      fontSize: fs14,
                                    )),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Container(
                                    width: 80,
                                    height: 34,
                                    child: BaseButton(
                                      onTap: () {
                                        BaseSharedPreference().clearAllSharedPreference();
                                        Get.offAll(() => LoginScreen());
                                      },
                                      title: "Yes",
                                      fontSize: fs14,
                                    )),
                              ],
                            ),
                            const SizedBox(height: 25.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      });
}

void showBookingCancelDialogue(BuildContext context) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              insetPadding: const EdgeInsets.symmetric(horizontal: 55.0),
              child: StatefulBuilder(builder: (context, setSta) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width,
                  // padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            SvgPicture.asset(warningIc),
                            const SizedBox(height: 25.0),
                            const Text(
                              "Are you sure to cancel\nthe booking",
                              style: TextStyle(
                                  fontSize: 23.0, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 17.0),
                            const Text(
                              "it will refund 50% amount of the booking and 50% penalty when you cancel it within 24 hours.\nIf the cancel before 4 hours of the meeting then you will get 25% amount of the booking Refund amount will be credited into your wallet and you can use it to booking next booking.",
                              style: TextStyle(fontSize: 15.0),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 27.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width: 80,
                                    height: 34,
                                    child: BaseButtonWithoutBackground(
                                      onTap: () {
                                        Get.back();
                                      },
                                      title: "No",
                                      btnColor: whiteColor,
                                      fontSize: fs14,
                                    )),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                SizedBox(
                                    width: 80,
                                    height: 34,
                                    child: BaseButton(
                                      onTap: () {
                                        Get.back();
                                      },
                                      title: "Yes",
                                      fontSize: fs14,
                                    )),
                              ],
                            ),
                            const SizedBox(height: 25.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      });
}

void showDeleteAccountDialogue(BuildContext context) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              insetPadding: const EdgeInsets.symmetric(horizontal: 55.0),
              child: StatefulBuilder(builder: (context, setSta) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width,
                  // padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            SvgPicture.asset(warningIc),
                            const SizedBox(height: 25.0),
                            const Text(
                              "Are you sure you want to delete this account?",
                              style: TextStyle(fontSize: 23.0),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width: 80,
                                    height: 34,
                                    child: BaseButtonWithoutBackground(
                                      onTap: () {
                                        Get.back();
                                      },
                                      title: "No",
                                      btnColor: whiteColor,
                                      fontSize: fs14,
                                    )),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                SizedBox(
                                    width: 80,
                                    height: 34,
                                    child: BaseButton(
                                      onTap: () {
                                        Get.back();
                                      },
                                      title: "Yes",
                                      fontSize: fs14,
                                    )),
                              ],
                            ),
                            const SizedBox(height: 25.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      });
}

List<String> avtarList = [
  'assets/icons/AVTAR1.svg',
  'assets/icons/AVTAR2.svg',
  'assets/icons/AVTAR3.svg',
  'assets/icons/AVTAR4.svg',
  'assets/icons/AVTAR5.svg',
  'assets/icons/AVTAR6.svg',
  'assets/icons/AVTAR7.svg',
  'assets/icons/AVTAR8.svg',
  'assets/icons/AVTAR9.svg',
];
int selectedAvtar = 1;
void showChangeAvtarDialogue(BuildContext context) {
  showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              insetPadding: const EdgeInsets.symmetric(horizontal: 55.0),
              child: StatefulBuilder(builder: (context, setSta) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width,
                  // padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: avtarList.length,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, mainAxisExtent: 100.0),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              selectedAvtar = index;
                              setSta(() {});
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 5.0),
                              padding: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: selectedAvtar == index
                                      ? Border.all(color: primaryColor)
                                      : null),
                              child: SvgPicture.asset(
                                avtarList[index],
                              ),
                            ),
                          ),
                        ),
                      ),
                      BaseButton(
                        title: 'Save',
                        onTap: () {
                          Get.back();
                        },
                        leftMargin: 50.0,
                        rightMargin: 50.0,
                        topMargin: 25.0,
                        bottomMargin: 25.0,
                        btnHeight: 45.0,
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      });
}
