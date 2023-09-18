import 'package:get/get.dart';
import 'package:todo_app/controllers/splash_controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SplashController());
  }

}