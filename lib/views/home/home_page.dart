import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/AppAssets/app_assets.dart';
import 'package:todo_app/controllers/dashboard_controller.dart';

import '../../constants/colors/app_colors.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final dashboardController = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: ()=>Get.back(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset(
                    AppAssets.backIcon,
                    height: 24,
                    width: 24,
                    color: dashboardController.isDarkMode.value
                        ? AppColors.primaryColorLight
                        : AppColors.primaryColorDark,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(
                  AppAssets.calenderIcon,
                  height: 24,
                  width: 24,
                  color: dashboardController.isDarkMode.value
                      ? AppColors.primaryColorLight
                      : AppColors.primaryColorDark,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
