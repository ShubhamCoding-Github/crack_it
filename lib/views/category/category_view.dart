import 'package:crack_it_user/utils/base_widgets/base_app_bar.dart';
import 'package:crack_it_user/utils/base_widgets/base_button.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:crack_it_user/utils/constants/base_images.dart';
import 'package:crack_it_user/views/category/controller/category_controller.dart';
import 'package:crack_it_user/views/category/sub_category_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  CategoryController controller = Get.put(CategoryController());

  List<String> images = [
    'assets/icons/1.svg',
    'assets/icons/2.svg',
    dataProcessingIc
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.selectedCategoryIndex.value=0;
    controller.getCategory();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: "Categories",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 36,
              ),
              const Text(
                "Select Your Job Category",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 36,
              ),
             Obx(() =>Expanded(
                child: SizedBox(
                  height: Get.height,
                  child:GridView.builder(
                    itemCount: controller.categories.length, // Total number of containers (3 per row)
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Number of columns per row
                      childAspectRatio: .8, // Adjust the aspect ratio here
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          controller.selectedCategoryIndex.value = index;
                        },
                        child: Obx(() => Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: controller.selectedCategoryIndex.value == index
                                    ? primaryColor
                                    : borderGrayColor,
                                width: controller.selectedCategoryIndex.value == index ? 2 : 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(images[index]),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                controller.categories[index].title??'',
                                style: const TextStyle(color: blackColor),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )),
                      );
                    },
                  ),
                ),
              )),
              BaseButton(
                title: 'CONTINUE',
                onTap: () {
                  if(controller.categories.isNotEmpty) {
                    Get.to(const SubCategoryView());
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
