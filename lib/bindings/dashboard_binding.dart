import 'package:get/get.dart';
import 'package:todo_app/controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(DashboardController());
  }

}