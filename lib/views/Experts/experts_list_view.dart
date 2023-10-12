import 'package:crack_it_user/utils/base_widgets/base_app_bar.dart';
import 'package:crack_it_user/utils/base_widgets/base_button.dart';
import 'package:crack_it_user/utils/base_widgets/base_text_field.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:crack_it_user/utils/constants/base_images.dart';
import 'package:crack_it_user/utils/constants/base_sizes.dart';
import 'package:crack_it_user/views/Experts/experts_profile.dart';
import 'package:crack_it_user/views/category/controller/category_controller.dart';
import 'package:crack_it_user/views/dashboard/dashboard_view.dart';
import 'package:crack_it_user/views/payment/payment_view.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ExpertsListView extends StatefulWidget {
  const ExpertsListView({super.key});

  @override
  State<ExpertsListView> createState() => _ExpertsListViewState();
}

class _ExpertsListViewState extends State<ExpertsListView> {

  CategoryController controller =Get.find<CategoryController>();

  int index = 0;
  var selectedTab = SelectedTab.add;

  void _handleIndexChanged(int i) {
    setState(() {
      // selectedTab = SelectedTab.values[i];
    });

    Get.offAll(DashboardView(
      isFromOther: true,
      index: i,
    ));
  }

  _getSelectedColor(int index) {
    return SelectedTab.values.indexOf(selectedTab) == index
        ? primaryColor
        : Colors.white;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getExpertList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "Experts",
        onBackPressed: (){
          Get.back();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                      child: BaseTextField(
                          radius: 18, hintText: "Search here...")),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return FilterOptions();
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: backgroundGrayColor,
                          borderRadius: BorderRadius.circular(15)),
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: SvgPicture.asset(
                          filterIc,
                          width: 30,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
             Obx(() =>ListView.builder(
                itemCount: controller.expertList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return buildExpertCard(index, context);
                },
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildExpertCard(index,context){
    return InkWell(
      onTap: () {
        Get.to(ExpertsProfileView(data:controller.expertList[index],));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                  width: 65,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${controller.expertList[index].user?.firstName??''}  ${controller.expertList[index].user?.lastName?[0].capitalizeFirst??''}",
                      style: const TextStyle(
                          fontSize: 24,
                          color: blackColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        "${controller.expertList[index].jobCategory?.title??''} | ${controller.expertList[index].experience} year",
                        style: TextStyle(fontSize: 16, color: textGrayColor),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: SvgPicture.asset(timeIc),
                        ),
                        Text(
                          "${controller.expertList[index].rating??''}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "\$59.0",
                      style: TextStyle(
                          fontSize: 22,
                          color: blackColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Visibility(
                      visible: true,
                      child: InkWell(
                        onTap: () {
                          controller.createBooking(expertId:controller.expertList[index].user!.sId!);
                        },
                        child: Container(
                            width: 100,
                            height: 34,
                            child: BaseButton(
                              title: "Request",
                              fontSize: fs16,
                            )),
                      ),
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

class FilterOptions extends StatefulWidget {
  @override
  _FilterOptionsState createState() => _FilterOptionsState();
}

class _FilterOptionsState extends State<FilterOptions> {
  double _minPrice = 0.0;
  double _maxPrice = 100.0;
  double _selectedRating = 3.0;
  double _selectedExperience = 3.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Filter Options',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text('Filter by Price'),
          RangeSlider(
            activeColor: primaryColor,
            inactiveColor: primaryColorLight,
            values: RangeValues(_minPrice, _maxPrice),
            onChanged: (RangeValues values) {
              setState(() {
                _minPrice = values.start;
                _maxPrice = values.end;
              });
            },
            min: 0.0,
            max: 100.0,
            divisions: 100,
            labels: RangeLabels('\$$_minPrice', '\$$_maxPrice'),
          ),
          SizedBox(height: 20),
          Text('Filter by Rating'),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 1; i <= 5; i++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedRating = i.toDouble();
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: i <= _selectedRating ? Colors.yellow : Colors.grey,
                    ),
                    child: Center(
                      child: Text(
                        i.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 20),
          Text('Filter by Experience'),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 1; i <= 5; i++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedExperience = i.toDouble();
                    });
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          i <= _selectedExperience ? Colors.blue : Colors.grey,
                    ),
                    child: Center(
                      child: Text(
                        i.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: primaryColor,
              onPrimary: Colors.white,
            ),
            onPressed: () {
              // Handle filtering with selected options
              Navigator.pop(context);
              // Add your logic here
            },
            child: Text('Apply Filters'),
          ),
        ],
      ),
    );
  }
}
