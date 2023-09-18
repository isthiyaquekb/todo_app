import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/constants/AppKeys/app_keys.dart';
import 'package:todo_app/constants/Routes/app_routes.dart';

class SplashController extends GetxController{

  final storageBox = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    storageBox.writeIfNull(AppKeys.keyIsDark, false);
    super.onInit();
    Timer(const Duration(seconds: 3), () => _navigationToHome());
  }

  _navigationToHome(){
    log("GO TO HOME PAGE");
    Get.offAndToNamed(AppRoutes.dashboard);
    // storageBox.read(AppKeys.keyIsLogged)? Get.offAndToNamed(AppRoutes.dashboard):Get.offAndToNamed(AppRoutes.login);
  }
}