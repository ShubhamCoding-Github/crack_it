import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/constants/base_colors.dart';
class BaseOverlays {


  // viewPdfDialog({String? url,bool? concatBaseUrl}){
  //   showGeneralDialog(context: Get.context!,
  //     pageBuilder: (context, animation, secondaryAnimation) {
  //       return ShowPdfViewDialog(
  //         url: (((url??'').contains("http")) ? (url??"") :  ApiEndPoints().imageBaseUrl+(url??"")),
  //         title: "Document",
  //       );
  //     },
  //   );
  // }

  // viewPhoto({String? url,bool? concatBaseUrl}){
  //   showGeneralDialog(context: Get.context!,
  //     pageBuilder: (context, animation, secondaryAnimation) {
  //       return Stack(
  //         alignment: Alignment.bottomCenter,
  //         clipBehavior: Clip.none,
  //         children: [
  //           PhotoView(
  //             imageProvider: NetworkImage(((url??'').contains("http")) ? (url??"") :  ApiEndPoints().imageBaseUrl+(url??"")),
  //             initialScale: PhotoViewComputedScale.contained * 1.0,
  //             maxScale: PhotoViewComputedScale.contained * 3.0,
  //             minScale: PhotoViewComputedScale.contained * 0.8,
  //             loadingBuilder: (context, event) => Center(
  //               child: Container(
  //                 width: 20.0,
  //                 height: 20.0,
  //                 child: CircularProgressIndicator(),
  //               ),
  //             ),
  //           ),
  //           Positioned(child: GestureDetector(
  //             onTap: (){
  //               BaseOverlays().dismissOverlay();
  //             },
  //             child: Padding(
  //               padding: const EdgeInsets.all(40),
  //               child: Icon(Icons.close_rounded,color: Colors.white,size: 40),
  //             ),
  //           )),
  //         ],
  //       );
  //     },
  //   );
  // }

  // showMediaPickerDialog({Function()? onCameraClick, Function()? onGalleryClick}) {
  //   final ImagePicker picker = ImagePicker();
  //   XFile? imageData;
  //   showGeneralDialog(
  //     context: Get.context!,
  //     barrierDismissible: true,
  //     barrierLabel: "",
  //     pageBuilder: (context, a1, a2) {
  //       return Dialog(
  //         insetPadding: EdgeInsets.symmetric(horizontal: 3.w),
  //         shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(14))),
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 16),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               SizedBox(height: 12),
  //               Align(
  //                 alignment: Alignment.topRight,
  //                 child: GestureDetector(
  //                     onTap: () {
  //                       Get.back();
  //                     },
  //                     child: SvgPicture.asset("assets/images/ic_close.svg",
  //                         height: 16)),
  //               ),
  //               SizedBox(height: 16),
  //               Row(
  //                 children: [
  //                   Expanded(
  //                       child: GestureDetector(
  //                         onTap: onCameraClick ?? () async {
  //                           Get.back();
  //                           await picker.pickImage(source: ImageSource.camera).then((value){
  //                             if (value != null) {
  //                               imageData = value;
  //                             }
  //                           });
  //                         },
  //                         child: Column(
  //                           children: [
  //                             Icon(Icons.camera_alt_outlined,
  //                                 color: BaseColors.primaryColor, size: 60),
  //                             SizedBox(height: 8),
  //                             Text("Camera"),
  //                           ],
  //                         ),
  //                       )),
  //                   Expanded(
  //                       child: GestureDetector(
  //                         onTap: onGalleryClick ?? () async {
  //                           Get.back();
  //                           await picker.pickImage(source: ImageSource.gallery).then((value){
  //                             if (value != null) {
  //                               imageData = value;
  //                             }
  //                           });
  //                         },
  //                         child: Column(
  //                           children: [
  //                             Icon(Icons.photo_library_outlined,
  //                                 color: BaseColors.primaryColor, size: 60),
  //                             SizedBox(height: 8),
  //                             Text("Gallery"),
  //                           ],
  //                         ),
  //                       )),
  //                 ],
  //               ),
  //               const SizedBox(height: 40),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }


  /// Loading
  void showLoader({bool? showLoader}) {
    if (showLoader ?? true) {
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (context) => WillPopScope(
          onWillPop: () async => false,
          child: Container(
            color: Colors.black26,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        ),
      );
    }
  }

  /// Dismiss Loader
  void dismissOverlay({bool? showLoader}) {
    if (showLoader ?? true) {
      Get.back(closeOverlays: true);
    }
  }

  void showSnackBar({String? title, required String message}) {
    Get.closeCurrentSnackbar();
    Get.closeAllSnackbars();
    Get.snackbar(
      title ?? "Error",
      message,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      backgroundColor: (title?.toLowerCase()) == "success"
          ? (Colors.green.shade800)
          : Colors.red,
      margin: EdgeInsets.zero,
      borderRadius: 0,
      icon: Icon(
          (title?.toLowerCase()) == "success"
              ? Icons.check_circle_outline
              : Icons.error_outline,
          color: Colors.white),
    );
  }

  void warningShowSnackBar({String? title, required String message}) {
    Get.closeCurrentSnackbar();
    // Get.closeAllSnackbars();
    Get.snackbar(
      title ?? "Warning",
      message,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      backgroundColor:primaryColor,
      margin: EdgeInsets.zero,
      borderRadius: 0,
      icon: Icon(Icons.error_outline,
          color: Colors.white),
    );
  }

}
