import 'package:crack_it_user/base_controller.dart';
import 'package:crack_it_user/response_modal/login_response_modal.dart';
import 'package:crack_it_user/storage/base_shared_preference.dart';
import 'package:crack_it_user/storage/sp_keys.dart';
import 'package:crack_it_user/views/dashboard/dashboard_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../backend/api_end_points.dart';
import '../../../backend/base_api.dart';
import '../../../storage/base_overlays.dart';

class LoginController extends GetxController{
   TextEditingController emailCtrl=TextEditingController();
   TextEditingController passwordCtrl=TextEditingController();
  RxBool hidePassword = false.obs;
  List<Map<String, dynamic>> languageList = [
    {'language': 'US English', 'isSelected': false},
    {'language': 'Italian', 'isSelected': false},
    {'language': 'French', 'isSelected': false},
    {'language': 'German', 'isSelected': false},
  ];
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

  Future<void> login()async{
    Map<String,dynamic> param={
      "email":emailCtrl.text,
      "password":passwordCtrl.text
    };
   await BaseAPI().post(url:ApiEndPoints.loginUser,data: param).then((value) {
      if(value!=null){
        LoginResponse response=LoginResponse.fromJson(value.data);
        if(response.success??false){
          BaseSharedPreference().setString(SpKeys.apiToken,response.data?.token??'');
          BaseSharedPreference().setBool(SpKeys.isLoggedIn,true);
          BaseSharedPreference().setJson(SpKeys.user,response.data?.user??{});
          Get.find<BaseController>().user=response.data?.user;
          Get.offAll(()=>const DashboardView());
          BaseOverlays().showSnackBar(message:response.message??'',title: "Success");
        }else{
          BaseOverlays().showSnackBar(message:response.message??'');
        }
      }
    });
  }
}