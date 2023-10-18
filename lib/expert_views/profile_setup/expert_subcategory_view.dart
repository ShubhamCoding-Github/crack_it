import 'package:crack_it_user/expert_views/profile_setup/expertcategary_controller.dart';
import 'package:crack_it_user/expert_views/profile_setup/profile_auth_controller.dart';
import 'package:crack_it_user/utils/base_widgets/base_app_bar.dart';
import 'package:crack_it_user/utils/base_widgets/base_button.dart';
import 'package:crack_it_user/utils/base_widgets/base_text_field.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ExpertSubCategoryView extends StatefulWidget {
  const ExpertSubCategoryView({super.key});

  @override
  State<ExpertSubCategoryView> createState() => _ExpertSubCategoryViewState();
}

class _ExpertSubCategoryViewState extends State<ExpertSubCategoryView> {
  ExpertCategoryController controller = Get.put( ExpertCategoryController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.selectedSubIndex.value=0;
    controller.selectedSubTypeIndex.value=0;
    controller.getSubCategory();
    controller.getTimeZone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: BaseAppBar(
          title: "Category",
          onBackPressed: (){
            Get.back();
          },
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 160.0,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: BaseTextField(
                                  onChanged: (String value){
                                    print("value--$value");
                                  },
                                  controller:controller.searchController.value,
                                  radius: 18, hintText: "Search here...")),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        height: 34,
                        child: Obx(() =>ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.subCategories.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                controller.selectedSubIndex.value = index;
                                controller.skills.clear();
                                controller.getSubTypeCategory();
                              },
                              child:Obx(() => Container(
                                margin:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8.0),
                                decoration: BoxDecoration(
                                  color: controller.selectedSubIndex.value == index
                                      ? primaryColor
                                      : whiteColor,
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                                child: Center(
                                  child: Text(
                                    controller.subCategories[index].title??'',
                                    style: TextStyle(
                                        color: controller.selectedSubIndex.value == index
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 16,
                                        fontWeight:
                                        controller.selectedSubIndex.value== index
                                            ? FontWeight.normal
                                            : FontWeight.bold),
                                  ),
                                ),
                              )),
                            );
                          },
                        )),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: SingleChildScrollView(
                    child: CustomGridWidget(),
                  ),
                ),
                BaseButton(
                  title: 'SAVE',
                  onTap: () {
                    Get.find<ProfileAuthController>().expertProfileSetup();
                  },
                )
              ],
            ),
          ),
        )
    );
  }
}

class CustomGridWidget extends StatefulWidget {
  const CustomGridWidget({super.key});

  @override
  State<CustomGridWidget> createState() => _CustomGridWidgetState();
}

class _CustomGridWidgetState extends State<CustomGridWidget> {
  ExpertCategoryController controller =Get.put(ExpertCategoryController());
  @override
  Widget build(BuildContext context) {
    return Obx(() =>GridView.builder(
      itemCount:controller.subTypeCategories.length, // Total number of containers (3 per row)
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns per row
        childAspectRatio: 2, // Adjust the aspect ratio here
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        String category = controller.subTypeCategories[index].sId!;
        bool isSelected = controller.skills.contains(category);
        return GestureDetector(
          onTap: () {
            if(controller.skills.contains(controller.subTypeCategories[index].sId)){
              controller.skills.remove(controller.subTypeCategories[index].sId);
            }else{
              controller.skills.add(controller.subTypeCategories[index].sId!);
            }
            print("skillss--${controller.skills}");
            controller.skills.refresh();
            setState(() {

            });
          },
          child:Obx(() => Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                  color: isSelected
                      ? primaryColor
                      : borderGrayColor,
                  width: isSelected ? 2 : 1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(controller.subTypeCategories[index].title??'',
                  style: TextStyle(
                      color: isSelected
                          ? primaryColor
                          : blackColor,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )),
        );
      },
    ));
  }
}
