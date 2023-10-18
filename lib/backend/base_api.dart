import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:crack_it_user/backend/api_end_points.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as X;


import '../storage/base_overlays.dart';
import '../storage/base_shared_preference.dart';
import '../storage/sp_keys.dart';

class BaseAPI {
  late Dio _dio;
  static final BaseAPI _singleton = BaseAPI._internal();

  factory BaseAPI() {
    return _singleton;
  }

  BaseAPI._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl:ApiEndPoints.baseUrl,
        connectTimeout:const Duration(seconds: 59),
        receiveTimeout:const Duration(seconds: 59),
        sendTimeout: const Duration(seconds: 59),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
    if (!kReleaseMode) {
      _dio.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
    }
    _dio.interceptors.add(LogInterceptor(responseBody: true,request: true,requestBody: true));
  }

  /// GET Method
  Future<Response?> get({required String url, Map<String, dynamic>? queryParameters,bool? showLoader,bool focusOff=true}) async {
    if (await checkInternetConnection()) {
      try {
        BaseOverlays().showLoader(showLoader: showLoader??true);
        focusOff ? FocusScope.of(X.Get.context!).requestFocus(FocusNode()):null;
        final String  token = await BaseSharedPreference().getString(SpKeys.apiToken)??'';
        final response = await _dio.get(url, options: Options(headers: {"Authorization": "Bearer $token"}),queryParameters: queryParameters,);
        BaseOverlays().dismissOverlay(showLoader: showLoader??true);
        return response;
      } on DioException catch (e) {
        BaseOverlays().dismissOverlay(showLoader: showLoader??true);
        _handleError(e);
        rethrow;
      }
    }else{
      BaseOverlays().showSnackBar(message:"No internet connection");
      return null;
    }
  }

  /// POST Method
  Future<Response?> post({required String url, dynamic data, Map<String, dynamic>? headers,bool? showLoader}) async {
    if (await checkInternetConnection()) {
      try {
        BaseOverlays().showLoader(showLoader: showLoader);
        FocusScope.of(X.Get.context!).requestFocus(FocusNode());
        final String token = await BaseSharedPreference().getString(SpKeys.apiToken)??"";
        final response = await _dio.post(url, data: data, options: Options(headers: headers??{"Authorization": "Bearer $token"}));
        BaseOverlays().dismissOverlay(showLoader: showLoader);
        return response;
      } on DioException catch (e) {
        BaseOverlays().dismissOverlay(showLoader: showLoader);
        _handleError(e);
        rethrow;
      }
    }else{
      BaseOverlays().showSnackBar(message:"No internet connection");
      return null;
    }
  }

  /// PATCH Method
  Future<Response?> patch({required String url, dynamic data, Map<String, dynamic>? headers,bool? concatUserId}) async {
    if (await checkInternetConnection()) {
      try {
        BaseOverlays().showLoader();
        FocusScope.of(X.Get.context!).requestFocus(new FocusNode());
        final String token = await BaseSharedPreference().getString(SpKeys.apiToken)??"";
        final String userId = await BaseSharedPreference().getString(SpKeys.userId)??"";
        final response = await _dio.patch(url+((concatUserId??false) ? userId : ""), data: data, options: Options(headers: headers??{"Authorization": "Bearer $token"}));
        BaseOverlays().dismissOverlay();
        return response;
      } on DioException catch (e) {
        BaseOverlays().dismissOverlay();
        _handleError(e);
        rethrow;
      }
    }else{
      BaseOverlays().showSnackBar(message:"No internet connection");
      return null;
    }
  }

  ///PUT Method
  Future<Response?> put({required String url, dynamic data, Map<String, dynamic>? headers}) async {
    if (await checkInternetConnection()) {
      try {
        BaseOverlays().showLoader();
        FocusScope.of(X.Get.context!).requestFocus(FocusNode());
        final String token = await BaseSharedPreference().getString(SpKeys.apiToken)??"";
        final response = await _dio.put(url, data: data, options: Options(headers: headers??{"Authorization": "Bearer $token"}));
        BaseOverlays().dismissOverlay();
        return response;
      } on DioException catch (e) {
        BaseOverlays().dismissOverlay();
        _handleError(e);
        rethrow;
      }
    }else{
      BaseOverlays().showSnackBar(message:"No internet connection");
      return null;
    }
  }

  /// Delete Method
  Future<Response?> delete({required String url, Map<String, dynamic>? headers, dynamic data}) async {
    FocusScope.of(X.Get.context!).requestFocus(FocusNode());
    if (await checkInternetConnection()) {
      try {
        BaseOverlays().showLoader();
        final String token = await BaseSharedPreference().getString(SpKeys.apiToken);
        final response = await _dio.delete(url, data: data, options: Options(headers: headers??{"Authorization": "Bearer $token"}));
        BaseOverlays().dismissOverlay();
        return response;
      } on DioException catch (e) {
        BaseOverlays().dismissOverlay();
        _handleError(e);
        rethrow;
      }
    }else{
      BaseOverlays().showSnackBar(message:"No internet connection");
      return null;
    }
  }

  /// Download Method
  // Future<Response> download(String url, {Map<String, dynamic>? headers, void Function(int, int)? onReceiveProgress}) async {
  //   // if android sdk greater than 12
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //   AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //
  //   if (Platform.isIOS) {
  //     // For iOS devices
  //     PermissionStatus permission = await Permission.storage.status;
  //     PermissionStatus permission2 = await Permission.manageExternalStorage.status;
  //
  //     while (permission != PermissionStatus.granted &&
  //         permission2 != PermissionStatus.granted) {
  //       Map<Permission, PermissionStatus> statuses = await [
  //         Permission.manageExternalStorage,
  //         Permission.storage,
  //         // Add more permissions as needed
  //       ].request();
  //       permission = statuses[Permission.storage]!;
  //       permission2 = statuses[Permission.manageExternalStorage]!;
  //     }
  //   } else if (Platform.isAndroid && androidInfo.version.sdkInt < 33) {
  //     // For Android devices with SDK version less than 33
  //     PermissionStatus permission = await Permission.storage.status;
  //     PermissionStatus permission2 = await Permission.manageExternalStorage.status;
  //
  //     while (permission != PermissionStatus.granted &&
  //         permission2 != PermissionStatus.granted) {
  //       Map<Permission, PermissionStatus> statuses = await [
  //         Permission.manageExternalStorage,
  //         Permission.storage,
  //         // Add more permissions as needed
  //       ].request();
  //       permission = statuses[Permission.storage]!;
  //       permission2 = statuses[Permission.manageExternalStorage]!;
  //     }
  //   }
  //
  //   try {
  //     String fileName = url.split('/').last;
  //     // create a directory in storage
  //     Directory? directory;
  //     if (Platform.isAndroid) {
  //       // Redirects it to download folder in android
  //       directory = Directory("/storage/emulated/0/Download");
  //     } else if (Platform.isIOS) {
  //       // Redirects it to download folder in IOS
  //       directory = await getDownloadsDirectory();
  //       directory = Directory(directory?.path.replaceAll('/Downloads', '') ?? '');
  //     } else {
  //       directory = await getApplicationDocumentsDirectory();
  //     }
  //     int? random = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  //     String savePath = (directory.path) + '/$random-$fileName';
  //
  //     log(savePath);
  //     log('/$random-$fileName');
  //
  //     int previousProgress = 0;
  //     bool isFirstProgressEvent = true;
  //
  //     final response = await _singleton._dio.download(((url).contains("http")) ? (url) :  "${ApiEndPoints().concatBaseUrl}/star-backend/$url", savePath, options: Options(headers: headers),
  //       onReceiveProgress: (receivedBytes, totalBytes) {
  //         if (isFirstProgressEvent) {
  //           isFirstProgressEvent = false;
  //           BaseOverlays().showLoader();
  //         }
  //
  //         int currentProgress = ((receivedBytes / totalBytes) * 100).toInt();
  //
  //         if (currentProgress - previousProgress >= 1 || currentProgress < 100) {
  //           previousProgress = currentProgress;
  //         }
  //       },
  //     );
  //
  //     BaseOverlays().dismissOverlay();
  //     // showSnackBar(message: 'Download Completed');
  //     NotificationService.display(0, translate(X.Get.context!).file_downloaded, translate(X.Get.context!).the_file_has_been_downloaded_successfully,"");
  //     var res = await OpenFile.open(savePath);
  //     print(res);
  //
  //     return response;
  //   } on DioError catch (e) {
  //     showSnackBar(message: e.message.toString());
  //     _handleError(e);
  //     throw e.message;
  //   }
  // }

  int _secondsRemaining = 20;
  /// Check Internet Connection
  Future<bool> checkInternetConnection() async {
   Timer timer;
   timer=Timer.periodic(const Duration(seconds: 1), (Timer timer){
      _secondsRemaining--;
      print("timer--||$_secondsRemaining");
      if(_secondsRemaining==10){
        print("slow internet");
        timer.cancel();
        BaseOverlays().warningShowSnackBar(message:"Slow internet connection detected");
      }
      if(_secondsRemaining<0){
        timer.cancel();
      }
    });
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        timer.cancel();
        return true;
      }else{
        log("No internet connection");
        timer.cancel();
        return false;
      }
    } on SocketException catch (_) {
      timer.cancel();
      return false;
    }
  }


  Future<Response> postFormData(String url, Map<String, dynamic> formData, {Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.post(url,
          data: FormData.fromMap(formData), options: Options(headers: headers));
      return response;
    } on DioError catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<Response> uploadFile(File file, String url,
      {Function(int, int)? onSendProgress}) async {
    try {
      final formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path),
      });
      final response = await _dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "multipart/form-data",
          },
        ),
        onSendProgress: onSendProgress,
      );
      return response;
    } on DioError catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<Response> uploadMultipleFiles(List<File> files, String url, {Function(int, int)? onSendProgress}) async {
    final dio = Dio();

    final formData = FormData();

    for (int i = 0; i < files.length; i++) {
      final file = files[i];
      formData.files.add(MapEntry("file$i", await MultipartFile.fromFile(file.path)));
    }

    return dio.post(url, data: formData, onSendProgress: onSendProgress);
  }

  void _handleError(DioException e) {
      log('erorr--->>>${e.type}');
     if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.sendTimeout) {
      log('Timeout Error: ${e.message}');
      BaseOverlays().showSnackBar(message:e.message??'');
    } else if (e.type == DioExceptionType.badResponse) {
      log('Bad Response Error: ${e.message}');
      try{
        BaseOverlays().showSnackBar(message: (e.response?.data['message']));
      }catch(error){
        BaseOverlays().showSnackBar(message:e.message??'');
      }
    } else if (e.type == DioExceptionType.cancel) {
      log('Request Cancelled Error: ${e.message}');
    } else {
      log('Unknown Error: ${e.message}');
    }
  }
}






