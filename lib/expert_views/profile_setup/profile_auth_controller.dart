import 'package:crack_it_user/expert_views/profile_setup/expertcategary_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../backend/api_end_points.dart';
import '../../backend/base_api.dart';
import '../../base_controller.dart';
import '../../response_modal/common_response_modal.dart';
import '../../storage/base_overlays.dart';
import '../../views/dashboard/dashboard_view.dart';

class  ProfileAuthController extends GetxController {
  ExpertCategoryController expertCategoryController= Get.put(ExpertCategoryController());
  Rx<TextEditingController> profileFirstName=TextEditingController().obs;
  Rx<TextEditingController> profileLastName=TextEditingController().obs;
  Rx<TextEditingController> profileEmail=TextEditingController().obs;
  Rx<TextEditingController> profilePhoneNumber=TextEditingController().obs;
  Rx<TextEditingController> profileExperience=TextEditingController().obs;
  Rx<TextEditingController> profileDescription=TextEditingController().obs;
  Rx<TextEditingController> profilePrice =TextEditingController().obs;
  late TextEditingController emailCtrl;
  late TextEditingController passwordCtrl;
  bool hidePassword = false;
  bool hideResetPassword = false;
  bool hideConfirmResetPassword = false;
  RxList<Map<String, dynamic>> languageList = [
    {'language': 'US English', 'isSelected': false},
    {'language': 'Italian', 'isSelected': false},
    {'language': 'French', 'isSelected': false},
    {'language': 'German', 'isSelected': false},
  ].obs;
  List<String> categoryList = [
    'DevOps Engineer',
    'Full-Stack Developer',
    'Data Engineer'
  ];
  int selectedCategory = -1;
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
  int selectedSubCategory = -1;
  int selectedIndex = 0;
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
  profileAuthController() {
    emailCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
  }
  Future<void> expertProfileSetup()async {

    dio.FormData data = dio.FormData.fromMap({
      "user":Get.find<BaseController>().user?.sId??'',
      "description":profileDescription.value.text,
      "price":profilePrice.value.text,
      "languages[0]":'English',
      "jobCategory":expertCategoryController.categories[expertCategoryController.selectedCategoryIndex.value].sId,
      "experience":profileExperience.value.text,
    });
    for(int index=0;index<expertCategoryController.skills.length;index++) {
      data.fields.add(MapEntry('expertise[$index]',expertCategoryController.skills[index]));
    }
    BaseAPI().post(url:ApiEndPoints.expertProfileSetup,data:data).then((value) {
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
