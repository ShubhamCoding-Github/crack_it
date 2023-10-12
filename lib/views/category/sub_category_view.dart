import 'package:crack_it_user/response_modal/timeZone_modal.dart';
import 'package:crack_it_user/utils/base_widgets/base_app_bar.dart';
import 'package:crack_it_user/utils/base_widgets/base_button.dart';
import 'package:crack_it_user/utils/base_widgets/base_text_field.dart';
import 'package:crack_it_user/utils/base_widgets/base_utility.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:crack_it_user/utils/constants/base_images.dart';
import 'package:crack_it_user/views/Experts/experts_list_view.dart';
import 'package:crack_it_user/views/category/controller/category_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SubCategoryView extends StatefulWidget {
  const SubCategoryView({super.key});

  @override
  State<SubCategoryView> createState() => _SubCategoryViewState();
}

class _SubCategoryViewState extends State<SubCategoryView> {
  CategoryController controller=Get.find<CategoryController>();

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
        title: "Request",
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
                          // const SizedBox(
                          //   width: 20,
                          // ),
                          // Container(
                          //   decoration: BoxDecoration(
                          //       color: backgroundGrayColor,
                          //       borderRadius: BorderRadius.circular(15)),
                          //   padding: const EdgeInsets.all(16),
                          //   child: Center(
                          //     child: SvgPicture.asset(
                          //       filterIc,
                          //       width: 30,
                          //     ),
                          //   ),
                          // )
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomGridWidget(),
                        const SizedBox(
                          height: 24,
                        ),
                         BaseTextField(
                          labelText: 'Job Description',
                          maxLines: 5,
                          controller: controller.jobDescription.value,
                        ),
                        const SizedBox(
                          height: 34,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: BaseTextField(
                                  controller: controller.dateController.value,
                              readOnly: true,
                              onTap: () {
                                showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2100)).then((value){
                                      controller.dateController.value.text=formatFlutterDateTime(flutterDateTime:value!);
                                });
                              },
                              labelText: 'Date',
                              suffix: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SvgPicture.asset(calendarIc)),
                            )),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: BaseTextField(
                              readOnly: true,
                              controller: controller.timeController.value,
                              labelText: 'Time',
                              onTap: () {
                                showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now()).then((value){
                                      controller.timeController.value.text=showFormatOfTimeOfDay(value!);
                                });
                              },
                              suffix: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SvgPicture.asset(
                                    timeGaryIc,
                                  )),
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: 34,
                        ),
                       Obx(() =>  DropdownButtonHideUnderline(
                          child: DropdownButton2<TimeZoneData>(
                            isExpanded: true,
                            isDense:true,
                            hint:  Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(controller.selectedTimeZone.value.name==null?'Select Time Zone':controller.selectedTimeZone.value.name!,
                                    style: const TextStyle(
                                      fontSize:16,
                                      fontWeight: FontWeight.normal,
                                      color:Colors.grey,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: controller.timeZoneList
                                .map((TimeZoneData item) => DropdownMenuItem<TimeZoneData>(
                              value: item,
                              child: Text(
                                item.name.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                                .toList(),
                            onChanged: (TimeZoneData? value) {
                              controller.selectedTimeZone.value=value!;
                            },
                            buttonStyleData: ButtonStyleData(
                              height:60,
                              padding: const EdgeInsets.only(left: 14, right: 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: borderGrayColor,
                                ),
                                color: Colors.white,
                              ),
                              elevation: 0,
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.keyboard_arrow_down_outlined,
                              ),
                              iconSize:25,
                              iconEnabledColor:Colors.grey,
                              iconDisabledColor: borderGrayColor,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 250,
                              //width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: primaryColor,
                              ),
                              offset: const Offset(0,-10),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all<double>(6),
                                thumbVisibility: MaterialStateProperty.all<bool>(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 50,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          ),
                        )),
                        const SizedBox(
                          height: 34,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Duration",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 9,
                        ),
                        SizedBox(
                          height: 80,
                          child:ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.timeList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                  onTap: () {
                                    controller.selectedTime.value = index;
                                  },
                                  child:Obx(() => Container(
                                    margin: const EdgeInsets.all(8),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              controller.selectedTime.value == index
                                                  ? primaryColor
                                                  : borderGrayColor,
                                          width:
                                              controller.selectedTime.value == index
                                                  ? 2
                                                  : 1),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller.timeList[index],
                                          style: TextStyle(
                                              color: controller.selectedTime.value ==
                                                      index
                                                  ? primaryColor
                                                  : blackColor,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  )));
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        BaseButton(
                          title: 'SUBMIT',
                          onTap: () {
                            Get.to(const ExpertsListView());
                          },
                        )
                      ],
                    ),
                  ),
                ),
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
  CategoryController controller =Get.find<CategoryController>();
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
