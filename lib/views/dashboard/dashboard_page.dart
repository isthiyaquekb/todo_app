import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/AppAssets/app_assets.dart';
import 'package:todo_app/constants/Themes/ThemeWidgets/text_theme.dart';
import 'package:todo_app/constants/Themes/app_themes.dart';
import 'package:todo_app/constants/themes/ThemeServices/theme_service.dart';
import 'package:todo_app/controllers/dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
          children: [

            VerticalDivider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 16,),
                  /*   InkWell(
                  onTap: () {
                    dashboardController.toggleDarkMode();
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      color: Colors.cyan,
                    ),
                    child: SvgPicture.asset(
                      dashboardController.isDarkMode.value
                          ? AppAssets.sun
                          : AppAssets.moon,
                      fit: BoxFit.contain,
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),*/
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("TASK LIST",
                                style: Theme.of(context).textTheme.labelLarge),
                            Text("WORK",
                                style: Theme.of(context).textTheme.displayLarge)
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
