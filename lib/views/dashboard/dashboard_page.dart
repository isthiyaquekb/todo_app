import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/constants/AppAssets/app_assets.dart';
import 'package:todo_app/constants/Colors/app_colors.dart';
import 'package:todo_app/constants/Routes/app_routes.dart';
import 'package:todo_app/controllers/dashboard_controller.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/widgets/task_card_container.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Row(
        children: [
          Expanded(
              child: Obx(
            () => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    height: 120,
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "TASK LIST",
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              Text(
                                dashboardController
                                    .myTabs[dashboardController
                                        .selectedTabIndex.value]
                                    .text
                                    .toString(),
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.createTask);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SvgPicture.asset(
                                  AppAssets.addIcon,
                                  height: 24,
                                  width: 24,
                                  color: dashboardController.isDarkMode.value
                                      ? AppColors.primaryColorLight
                                      : AppColors.primaryColorDark,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                dashboardController.toggleDarkMode();
                              },
                              child: SvgPicture.asset(
                                dashboardController.isDarkMode.value
                                    ? AppAssets.sun
                                    : AppAssets.moon,
                                height: 24,
                                width: 24,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Padding(
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: TabBarView(
                        controller: dashboardController.tabController,
                        children: [
                          dashboardController.filterTaskList.isNotEmpty
                              ? Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 0.0, horizontal: 8.0),
                                  width: MediaQuery.of(context).size.width,
                                  child: GetBuilder<DashboardController>(
                                    builder: (controller) => ListView.builder(
                                        itemCount:
                                            controller.filterTaskList.length,
                                        itemBuilder: (context, index) =>
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0,
                                                      horizontal: 4.0),
                                              child: TaskCardContainer(
                                                colorBg: dashboardController.filterTaskList[index].status?AppColors.green400:AppColors.cardColor,
                                                title: controller
                                                    .filterTaskList[index]
                                                    .title,
                                                date: controller
                                                    .filterTaskList[index]
                                                    .taskDate,
                                                startTime: controller
                                                    .filterTaskList[index]
                                                    .taskFromTime,
                                                endDate: controller
                                                    .filterTaskList[index]
                                                    .taskToTime,
                                                tap: () =>
                                                    _bottomUploadImageSheet(
                                                        context,index),
                                              ),
                                            )),
                                  ),
                                )
                              : SizedBox(
                                  width: 120,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Lottie.asset(AppAssets.searchingLottie,height: 140,
                                        width: 120,fit: BoxFit.contain),
                                      Center(
                                        child: Text(
                                          "No item found",
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge,
                                        ),
                                      ),
                                    ],
                                  )),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 8.0),
                            width: MediaQuery.of(context).size.width,
                            child: GetBuilder<DashboardController>(
                              builder: (controller) => ListView.builder(
                                  itemCount: controller.filterTaskList.length,
                                  itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0, horizontal: 4.0),
                                        child: TaskCardContainer(
                                          colorBg: dashboardController.filterTaskList[index].status?AppColors.green400:AppColors.cardColor,
                                          title: controller
                                              .filterTaskList[index].title,
                                          date: controller
                                              .filterTaskList[index].taskDate,
                                          startTime: controller
                                              .filterTaskList[index]
                                              .taskFromTime,
                                          endDate: controller
                                              .filterTaskList[index].taskToTime,
                                          tap: () =>
                                              _bottomUploadImageSheet(
                                                  context,index),
                                        ),
                                      )),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 8.0),
                            width: MediaQuery.of(context).size.width,
                            child: GetBuilder<DashboardController>(
                              builder: (controller) => ListView.builder(
                                  itemCount: controller.filterTaskList.length,
                                  itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0, horizontal: 4.0),
                                        child: TaskCardContainer(
                                          colorBg: dashboardController.filterTaskList[index].status?AppColors.green400:AppColors.cardColor,
                                          title: controller
                                              .filterTaskList[index].title,
                                          date: controller
                                              .filterTaskList[index].taskDate,
                                          startTime: controller
                                              .filterTaskList[index]
                                              .taskFromTime,
                                          endDate: controller
                                              .filterTaskList[index].taskToTime,
                                          tap: () =>
                                              _bottomUploadImageSheet(
                                                  context,index),
                                        ),
                                      )),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 8.0),
                            width: MediaQuery.of(context).size.width,
                            child: GetBuilder<DashboardController>(
                              builder: (controller) => ListView.builder(
                                  itemCount: controller.filterTaskList.length,
                                  itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0, horizontal: 4.0),
                                        child: TaskCardContainer(
                                          colorBg: dashboardController.filterTaskList[index].status?AppColors.green400:AppColors.cardColor,
                                          title: controller
                                              .filterTaskList[index].title,
                                          date: controller
                                              .filterTaskList[index].taskDate,
                                          startTime: controller
                                              .filterTaskList[index]
                                              .taskFromTime,
                                          endDate: controller
                                              .filterTaskList[index].taskToTime,
                                          tap: () =>
                                              _bottomUploadImageSheet(
                                                  context,index),
                                        ),
                                      )),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 8.0),
                            width: MediaQuery.of(context).size.width,
                            child: GetBuilder<DashboardController>(
                              builder: (controller) => ListView.builder(
                                  itemCount: controller.filterTaskList.length,
                                  itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0, horizontal: 4.0),
                                        child: TaskCardContainer(
                                          colorBg: dashboardController.filterTaskList[index].status?AppColors.green400:AppColors.cardColor,
                                          title: controller
                                              .filterTaskList[index].title,
                                          date: controller
                                              .filterTaskList[index].taskDate,
                                          startTime: controller
                                              .filterTaskList[index]
                                              .taskFromTime,
                                          endDate: controller
                                              .filterTaskList[index].taskToTime,
                                          tap: () =>
                                              _bottomUploadImageSheet(
                                                  context,index),
                                        ),
                                      )),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 8.0),
                            width: MediaQuery.of(context).size.width,
                            child: GetBuilder<DashboardController>(
                              builder: (controller) => ListView.builder(
                                  itemCount: controller.filterTaskList.length,
                                  itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0, horizontal: 4.0),
                                        child: TaskCardContainer(
                                          colorBg: dashboardController.filterTaskList[index].status?AppColors.green400:AppColors.cardColor,
                                          title: controller
                                              .filterTaskList[index].title,
                                          date: controller
                                              .filterTaskList[index].taskDate,
                                          startTime: controller
                                              .filterTaskList[index]
                                              .taskFromTime,
                                          endDate: controller
                                              .filterTaskList[index].taskToTime,
                                          tap: () =>
                                              _bottomUploadImageSheet(
                                                  context,index),
                                        ),
                                      )),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 8.0),
                            width: MediaQuery.of(context).size.width,
                            child: GetBuilder<DashboardController>(
                              builder: (controller) => ListView.builder(
                                  itemCount: controller.filterTaskList.length,
                                  itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0, horizontal: 4.0),
                                        child: TaskCardContainer(
                                          colorBg: dashboardController.filterTaskList[index].status?AppColors.green400:AppColors.cardColor,
                                          title: controller
                                              .filterTaskList[index].title,
                                          date: controller
                                              .filterTaskList[index].taskDate,
                                          startTime: controller
                                              .filterTaskList[index]
                                              .taskFromTime,
                                          endDate: controller
                                              .filterTaskList[index].taskToTime,
                                          tap: () =>
                                              _bottomUploadImageSheet(
                                                  context,index),
                                        ),
                                      )),
                            ),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          )),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: GetBuilder<DashboardController>(
                builder: (dashboardController) => RotatedBox(
                      quarterTurns: 3,
                      child: TabBar(
                        controller: dashboardController.tabController,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: Theme.of(context).tabBarTheme.indicator,
                        indicatorColor:
                            Theme.of(context).tabBarTheme.indicatorColor,
                        labelColor: Theme.of(context).tabBarTheme.labelColor,
                        isScrollable: true,
                        unselectedLabelColor:
                            Theme.of(context).tabBarTheme.unselectedLabelColor,
                        unselectedLabelStyle:
                            Theme.of(context).tabBarTheme.unselectedLabelStyle,
                        tabs: dashboardController.myTabs,
                        onTap: (int index) {
                          dashboardController.changeTabIndex(index);
                        },
                      ),
                    )),
          ),
        ],
      ),
    );
  }

  void _bottomUploadImageSheet(BuildContext ctx,int index) {
    showModalBottomSheet(
        context: ctx,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        isDismissible: false,
        builder: (ctx) {
          return GetBuilder<DashboardController>(
              builder: (dashboardController) => StatefulBuilder(
                      builder: (BuildContext context, StateSetter setter) {
                    return Container(
                        height: MediaQuery.of(context).size.height * 0.16,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30)),
                          color: dashboardController.filterTaskList[index].status
                              ? AppColors.green400
                              : AppColors.primaryColorDark,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap:  dashboardController.filterTaskList[index].status?null:() {
                                      dashboardController.filterTaskList[index].status=!dashboardController.filterTaskList[index].status;
                                      log("STATUS:${!dashboardController.filterTaskList[index].status}");
                                      // Get.put(TaskController()).setUpdateStatus(!dashboardController.filterTaskList[index].status);
                                      Get.put(TaskController()).updateTaskStatus(dashboardController.filterTaskList[index]);
                                      Get.back();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: dashboardController
                                                  .isDarkMode.value
                                              ? AppColors.primaryColorLight
                                              : AppColors.primaryColorDark,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: dashboardController
                                                        .isDarkMode.value
                                                    ? Colors.black12
                                                    : Colors.white12,
                                                offset: const Offset(4, 4),
                                                blurRadius: 10,
                                                spreadRadius: 1),
                                            BoxShadow(
                                                color: dashboardController
                                                        .isDarkMode.value
                                                    ? Colors.white12
                                                    : Colors.black12,
                                                offset: const Offset(-4, -4),
                                                blurRadius: 10,
                                                spreadRadius: 1),
                                          ]),
                                      child: Center(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              AppAssets.taskCompleteIcon,
                                              color: dashboardController
                                                      .isDarkMode.value
                                                  ? AppColors.primaryColorDark
                                                  : AppColors.primaryColorLight,
                                              height: 24,
                                              width: 24,
                                              fit: BoxFit.scaleDown,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Complete Task",
                                              style: TextStyle(
                                                  color: dashboardController
                                                          .isDarkMode.value
                                                      ? AppColors
                                                          .primaryColorDark
                                                      : AppColors
                                                          .primaryColorLight,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.put(TaskController()).deleteItem(dashboardController.filterTaskList[index]);
                                      Get.back();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: dashboardController
                                                  .isDarkMode.value
                                              ? AppColors.primaryColorLight
                                              : AppColors.primaryColorDark,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: dashboardController
                                                        .isDarkMode.value
                                                    ? Colors.black12
                                                    : Colors.white12,
                                                offset: const Offset(4, 4),
                                                blurRadius: 10,
                                                spreadRadius: 1),
                                            BoxShadow(
                                                color: dashboardController
                                                        .isDarkMode.value
                                                    ? Colors.white12
                                                    : Colors.black12,
                                                offset: const Offset(-4, -4),
                                                blurRadius: 10,
                                                spreadRadius: 1),
                                          ]),
                                      child: Center(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              AppAssets.deleteIcon,
                                              color: dashboardController
                                                      .isDarkMode.value
                                                  ? AppColors.primaryColorDark
                                                  : AppColors.primaryColorLight,
                                              height: 24,
                                              width: 24,
                                              fit: BoxFit.scaleDown,
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              "Delete Task",
                                              style: TextStyle(
                                                  color: dashboardController
                                                          .isDarkMode.value
                                                      ? AppColors
                                                          .primaryColorDark
                                                      : AppColors
                                                          .primaryColorLight,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ));
                  }));
        });
  }
}
