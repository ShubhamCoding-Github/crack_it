import 'package:crack_it_user/base_controller.dart';
import 'package:crack_it_user/response_modal/common_response_modal.dart';
import 'package:crack_it_user/response_modal/expert_list_modal.dart';
import 'package:crack_it_user/response_modal/timeZone_modal.dart';
import 'package:crack_it_user/utils/base_widgets/base_utility.dart';
import 'package:crack_it_user/views/dashboard/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../backend/api_end_points.dart';
import '../../../backend/base_api.dart';
import '../../../response_modal/all_category_modal.dart';
import '../../../storage/base_overlays.dart';
import 'package:dio/dio.dart' as dio;
class ExpertCategoryController extends GetxController {

  final List<String> timeList = [
    '30 min',
    '1 hour',
    '1.5 hour',
    '2 hour',
    '2.5 hour',
  ];
  List<String> subCategoryList = [
    'HTML',
    'CSS',
    'JavaScript',
    'React',
    'Angular',
    'Vue.js',
    'Bootstrap',
    'Material Design',
    'Sass',
    'Less',
    'TypeScript',
  ];
  List<String> backEndList = [
    'PHP',
    'Python',
    'JavaScript',
    'Laravel',
    'Django',
    'MongoDB',
    'MySQL',
    'Apache',
  ];
  List<String> databasesList = [
    'The Oracle',
    'MS SQL Server',
    'PostgreSQL',
    'IBM DB2',
    'Redis',
    'Elasticsearch',
  ];
  RxInt selectedCategoryIndex =0.obs;
  RxInt selectedSubIndex = 0.obs;
  RxInt selectedSubTypeIndex = 0.obs;
  RxInt selectedTime = 0.obs;
  final List<String> items = [
    'FRONT-END',
    'BACK-END',
    'DATABASES',
    'VERSION CONTROL',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
  ];

  Rx<TextEditingController>searchController=TextEditingController().obs;
  Rx<TextEditingController>jobDescription=TextEditingController().obs;
  Rx<TextEditingController>dateController=TextEditingController().obs;
  Rx<TextEditingController>timeController=TextEditingController().obs;
  RxList<CategoryData> categories=<CategoryData>[].obs;
  RxList<CategoryData> subCategories=<CategoryData>[].obs;
  RxList<CategoryData> subTypeCategories=<CategoryData>[].obs;
  RxList<ExpertData> expertList=<ExpertData>[].obs;
  RxList<TimeZoneData> timeZoneList=<TimeZoneData>[].obs;
  RxList<String> skills=<String>[].obs;
  Rx<TimeZoneData> selectedTimeZone=TimeZoneData().obs;

  Future <void> getCategory()async{
    categories.clear();
    await BaseAPI().get(url: ApiEndPoints.getCategory).then((value){
      if (value!=null) {
        AllCategoryResponse response=AllCategoryResponse.fromJson(value.data);
        if(response.success??false){
          categories.value=response.data??[];
        }else {
          BaseOverlays().showSnackBar(message:response.message??'',title:"Error");
        }
      }else{
        BaseOverlays().showSnackBar(message:"Something went wrong",title:"Error");
      }
    });
  }

  Future <void> getSubCategory()async{
    subCategories.clear();
    subTypeCategories.clear();
    Map<String,dynamic> param={
      "parent":categories[selectedCategoryIndex.value].sId,
      "search":searchController.value.text.trim()
    };
    await BaseAPI().get(url: ApiEndPoints.getCategory,queryParameters: param).then((value){
      if (value!=null) {
        AllCategoryResponse response=AllCategoryResponse.fromJson(value.data);
        if(response.success??false){
          subCategories.value=response.data??[];
          getSubTypeCategory();
        }else {
          BaseOverlays().showSnackBar(message:response.message??'',title:"Error");
        }
      }else{
        BaseOverlays().showSnackBar(message:"Something went wrong",title:"Error");
      }
    });
  }

  Future <void> getSubTypeCategory()async{
    subTypeCategories.clear();
    Map<String,dynamic> param={
      "parent":subCategories[selectedSubIndex.value].sId,
      "search":searchController.value.text.trim()
    };
    await BaseAPI().get(url: ApiEndPoints.getCategory,queryParameters: param).then((value){
      if (value!=null) {
        AllCategoryResponse response=AllCategoryResponse.fromJson(value.data);
        if(response.success??false){
          subTypeCategories.value=response.data??[];
        }else {
          BaseOverlays().showSnackBar(message:response.message??'',title:"Error");
        }
      }else{
        BaseOverlays().showSnackBar(message:"Something went wrong",title:"Error");
      }
    });
  }

  Future <void> getTimeZone()async{
    await BaseAPI().get(url: ApiEndPoints.getTimeZone).then((value){
      if (value!=null) {
        TimeZoneResponse response=TimeZoneResponse.fromJson(value.data);
        if(response.success??false){
          timeZoneList.value=response.data??[];
        }else {
          BaseOverlays().showSnackBar(message:response.message??'',title:"Error");
        }
      }else{
        BaseOverlays().showSnackBar(message:"Something went wrong",title:"Error");
      }
    });
  }

  Future <void> getExpertList()async{
    Map<String,dynamic> param={
      "jobCategory":"650a9a876328a294ceb843d1",
      // "search":searchController.value.text.trim()
    };
    await BaseAPI().get(url: ApiEndPoints.getExpertList,queryParameters: param).then((value){
      if (value!=null) {
        ExpertListResponse response=ExpertListResponse.fromJson(value.data);
        if(response.success??false){
          expertList.value=response.data??[];
        }else {
          BaseOverlays().showSnackBar(message:response.message??'',title:"Error");
        }
      }else{
        BaseOverlays().showSnackBar(message:"Something went wrong",title:"Error");
      }
    });
  }

  Future<void> createBooking({required String expertId})async {
    dio.FormData data = dio.FormData.fromMap({
      "user":Get.find<BaseController>().user?.sId??'',
      "expert":expertId,
      "jobCategory":categories[selectedCategoryIndex.value].sId,
      "jobDescription":jobDescription.value.text.trim(),
      "duration":selectedTime.value==0?30:selectedTime.value==1?60:selectedTime.value==2?90:selectedTime.value==3?120:150,
      "timeZone":selectedTimeZone.value.symbol,
      "date":dateController.value.text,
      "startTime":backendFormatOfTime(timeController.value.text)
    });
    for(int index=0;index<skills.length;index++) {
      data.fields.add(MapEntry('skills[$index]', skills[index]));
    }
    BaseAPI().post(url:ApiEndPoints.createBooking,data:data).then((value) {
      if(value!=null){
        CommonResponse response=CommonResponse.fromJson(value.data);
        if(response.success??false){
          Get.offAll(()=>const DashboardView());
          BaseOverlays().showSnackBar(message:response.message??'',title: "Success");
        }else{
          BaseOverlays().showSnackBar(message:response.message??'');
        }
      }
    });
  }
}
