import 'package:get/get.dart';
import 'package:todo_app/bindings/dashboard_binding.dart';
import 'package:todo_app/bindings/splash_binding.dart';
import 'package:todo_app/views/dashboard/dashboard_page.dart';
import 'package:todo_app/views/home/home_page.dart';
import 'package:todo_app/views/splash_page/splash.dart';

abstract  class AppRoutes{
  static const splash="/";
  static const dashboard="/dashboard";
  static const home="/home";

  static final List<GetPage> pages=[
    GetPage(name: AppRoutes.splash, page: ()=> SplashPage(),binding: SplashBinding()),
    GetPage(name: AppRoutes.dashboard, page: ()=> DashboardPage(),binding: DashboardBinding()),
    GetPage(name: AppRoutes.home, page: ()=> HomePage(),binding: DashboardBinding()),
  ];
}