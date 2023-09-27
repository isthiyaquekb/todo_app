import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constants/AppAssets/app_assets.dart';
import 'package:todo_app/constants/Colors/app_colors.dart';
import 'package:todo_app/constants/Routes/app_routes.dart';
import 'package:todo_app/controllers/dashboard_controller.dart';

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
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 8.0),
                            width: MediaQuery.of(context).size.width,
                            child: GetBuilder<DashboardController>(
                              builder: (controller) => ListView.builder(
                                  itemCount: controller.filterTaskList.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding:  const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 4.0),
                                        child: controller.filterTaskList.isNotEmpty
                                            ? Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.25,
                                                width: double.maxFinite,
                                                decoration: BoxDecoration(
                                                  color: AppColors.red200,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    border: Border.all(
                                                        color: AppColors
                                                            .borderColors)),
                                                child: Padding(
                                                  padding:  const EdgeInsets.symmetric(
                                                      vertical: 16.0, horizontal: 8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        controller
                                                            .filterTaskList[
                                                                index]
                                                            .title,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displayMedium,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            DateFormat(
                                                                    'd MMM yyyy')
                                                                .format(DateTime
                                                                    .parse(controller
                                                                        .filterTaskList[
                                                                            index]
                                                                        .taskDate)),
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleMedium,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                DateFormat.jm().format(
                                                                    DateTime.parse(controller
                                                                        .filterTaskList[
                                                                            index]
                                                                        .taskFromTime)),
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleMedium,
                                                              ),
                                                              Text(
                                                                " - ",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleMedium,
                                                              ),
                                                              Text(
                                                                DateFormat.jm().format(
                                                                    DateTime.parse(controller
                                                                        .filterTaskList[
                                                                            index]
                                                                        .taskToTime)),
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleMedium,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : Container(
                                                height: 120,
                                                width: 120,
                                                color: Colors.amber,
                                                child: Center(
                                                  child: Text(
                                                    "No item found",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displayLarge,
                                                  ),
                                                )),
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
                                    padding:  const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 4.0),
                                    child: controller.filterTaskList.isNotEmpty
                                        ? Container(
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.25,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                          color: AppColors.orange200,
                                          borderRadius:
                                          BorderRadius.circular(
                                              20),
                                          border: Border.all(
                                              color: AppColors
                                                  .borderColors)),
                                      child: Padding(
                                        padding:  const EdgeInsets.symmetric(
                                            vertical: 16.0, horizontal: 8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              controller
                                                  .filterTaskList[
                                              index]
                                                  .title,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  DateFormat(
                                                      'd MMM yyyy')
                                                      .format(DateTime
                                                      .parse(controller
                                                      .filterTaskList[
                                                  index]
                                                      .taskDate)),
                                                  style: Theme.of(
                                                      context)
                                                      .textTheme
                                                      .titleMedium,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .end,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                      DateFormat.jm().format(
                                                          DateTime.parse(controller
                                                              .filterTaskList[
                                                          index]
                                                              .taskFromTime)),
                                                      style: Theme.of(
                                                          context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                    Text(
                                                      " - ",
                                                      style: Theme.of(
                                                          context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                    Text(
                                                      DateFormat.jm().format(
                                                          DateTime.parse(controller
                                                              .filterTaskList[
                                                          index]
                                                              .taskToTime)),
                                                      style: Theme.of(
                                                          context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                        : Container(
                                        height: 120,
                                        width: 120,
                                        color: Colors.amber,
                                        child: Center(
                                          child: Text(
                                            "No item found",
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge,
                                          ),
                                        )),
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
                                    padding:  const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 4.0),
                                    child: controller.filterTaskList.isNotEmpty
                                        ? Container(
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.25,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                          color: AppColors.yellow200,
                                          borderRadius:
                                          BorderRadius.circular(
                                              20),
                                          border: Border.all(
                                              color: AppColors
                                                  .borderColors)),
                                      child: Padding(
                                        padding:  const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              controller
                                                  .filterTaskList[
                                              index]
                                                  .title,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  DateFormat(
                                                      'd MMM yyyy')
                                                      .format(DateTime
                                                      .parse(controller
                                                      .filterTaskList[
                                                  index]
                                                      .taskDate)),
                                                  style: Theme.of(
                                                      context)
                                                      .textTheme
                                                      .titleMedium,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .end,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                      DateFormat.jm().format(
                                                          DateTime.parse(controller
                                                              .filterTaskList[
                                                          index]
                                                              .taskFromTime)),
                                                      style: Theme.of(
                                                          context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                    Text(
                                                      " - ",
                                                      style: Theme.of(
                                                          context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                    Text(
                                                      DateFormat.jm().format(
                                                          DateTime.parse(controller
                                                              .filterTaskList[
                                                          index]
                                                              .taskToTime)),
                                                      style: Theme.of(
                                                          context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                        : Container(
                                        height: 120,
                                        width: 120,
                                        color: Colors.amber,
                                        child: Center(
                                          child: Text(
                                            "No item found",
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge,
                                          ),
                                        )),
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
                                    padding:  const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 4.0),
                                    child: controller.filterTaskList.isNotEmpty
                                        ? Container(
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.25,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                          color: AppColors.green200,
                                          borderRadius:
                                          BorderRadius.circular(
                                              20),
                                          border: Border.all(
                                              color: AppColors
                                                  .borderColors)),
                                      child: Padding(
                                        padding:  const EdgeInsets.symmetric(
                                            vertical: 16.0, horizontal: 8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              controller
                                                  .filterTaskList[
                                              index]
                                                  .title,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  DateFormat(
                                                      'd MMM yyyy')
                                                      .format(DateTime
                                                      .parse(controller
                                                      .filterTaskList[
                                                  index]
                                                      .taskDate)),
                                                  style: Theme.of(
                                                      context)
                                                      .textTheme
                                                      .titleMedium,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .end,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                      DateFormat.jm().format(
                                                          DateTime.parse(controller
                                                              .filterTaskList[
                                                          index]
                                                              .taskFromTime)),
                                                      style: Theme.of(
                                                          context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                    Text(
                                                      " - ",
                                                      style: Theme.of(
                                                          context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                    Text(
                                                      DateFormat.jm().format(
                                                          DateTime.parse(controller
                                                              .filterTaskList[
                                                          index]
                                                              .taskToTime)),
                                                      style: Theme.of(
                                                          context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                        : Container(
                                        height: 120,
                                        width: 120,
                                        color: Colors.amber,
                                        child: Center(
                                          child: Text(
                                            "No item found",
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge,
                                          ),
                                        )),
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
                                    padding:  const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 4.0),
                                    child: controller.filterTaskList.isNotEmpty
                                        ? Container(
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.25,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                          color: AppColors.blue200,
                                          borderRadius:
                                          BorderRadius.circular(
                                              20),
                                          border: Border.all(
                                              color: AppColors
                                                  .borderColors)),
                                      child: Padding(
                                        padding:  const EdgeInsets.symmetric(
                                            vertical: 16.0, horizontal: 8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              controller
                                                  .filterTaskList[
                                              index]
                                                  .title,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  DateFormat(
                                                      'd MMM yyyy')
                                                      .format(DateTime
                                                      .parse(controller
                                                      .filterTaskList[
                                                  index]
                                                      .taskDate)),
                                                  style: Theme.of(
                                                      context)
                                                      .textTheme
                                                      .titleMedium,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .end,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                      DateFormat.jm().format(
                                                          DateTime.parse(controller
                                                              .filterTaskList[
                                                          index]
                                                              .taskFromTime)),
                                                      style: Theme.of(
                                                          context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                    Text(
                                                      " - ",
                                                      style: Theme.of(
                                                          context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                    Text(
                                                      DateFormat.jm().format(
                                                          DateTime.parse(controller
                                                              .filterTaskList[
                                                          index]
                                                              .taskToTime)),
                                                      style: Theme.of(
                                                          context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                        : Container(
                                        height: 120,
                                        width: 120,
                                        color: Colors.amber,
                                        child: Center(
                                          child: Text(
                                            "No item found",
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge,
                                          ),
                                        )),
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
                                    padding:  const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 4.0),
                                    child: controller.filterTaskList.isNotEmpty
                                        ? Container(
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.25,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                          color: AppColors.indigo200,
                                          borderRadius:
                                          BorderRadius.circular(
                                              20),
                                          border: Border.all(
                                              color: AppColors
                                                  .borderColors)),
                                      child: Padding(
                                        padding:  const EdgeInsets.symmetric(
                                            vertical: 16.0, horizontal: 8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              controller
                                                  .filterTaskList[
                                              index]
                                                  .title,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  DateFormat(
                                                      'd MMM yyyy')
                                                      .format(DateTime
                                                      .parse(controller
                                                      .filterTaskList[
                                                  index]
                                                      .taskDate)),
                                                  style: Theme.of(
                                                      context)
                                                      .textTheme
                                                      .titleMedium,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .end,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                      DateFormat.jm().format(
                                                          DateTime.parse(controller
                                                              .filterTaskList[
                                                          index]
                                                              .taskFromTime)),
                                                      style: Theme.of(
                                                          context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                    Text(
                                                      " - ",
                                                      style: Theme.of(
                                                          context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                    Text(
                                                      DateFormat.jm().format(
                                                          DateTime.parse(controller
                                                              .filterTaskList[
                                                          index]
                                                              .taskToTime)),
                                                      style: Theme.of(
                                                          context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                        : Container(
                                        height: 120,
                                        width: 120,
                                        color: Colors.amber,
                                        child: Center(
                                          child: Text(
                                            "No item found",
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge,
                                          ),
                                        )),
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
                                    padding:  const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 4.0),
                                    child: controller.filterTaskList.isNotEmpty
                                        ? Container(
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.25,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                          color: AppColors.violet200,
                                          borderRadius:
                                          BorderRadius.circular(
                                              20),
                                          border: Border.all(
                                              color: AppColors
                                                  .borderColors)),
                                      child: Padding(
                                        padding:  const EdgeInsets.symmetric(
                                            vertical: 16.0, horizontal:8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                          children: [
                                            Text(
                                              controller
                                                  .filterTaskList[
                                              index]
                                                  .title,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  DateFormat(
                                                      'd MMM yyyy')
                                                      .format(DateTime
                                                      .parse(controller
                                                      .filterTaskList[
                                                  index]
                                                      .taskDate)),
                                                  style: Theme.of(
                                                      context)
                                                      .textTheme
                                                      .titleMedium,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .end,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  children: [
                                                    Text(
                                                      DateFormat.jm().format(
                                                          DateTime.parse(controller
                                                              .filterTaskList[
                                                          index]
                                                              .taskFromTime)),
                                                      style: Theme.of(
                                                          context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                    Text(
                                                      " - ",
                                                      style: Theme.of(
                                                          context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                    Text(
                                                      DateFormat.jm().format(
                                                          DateTime.parse(controller
                                                              .filterTaskList[
                                                          index]
                                                              .taskToTime)),
                                                      style: Theme.of(
                                                          context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                        : Container(
                                        height: 120,
                                        width: 120,
                                        color: Colors.amber,
                                        child: Center(
                                          child: Text(
                                            "No item found",
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge,
                                          ),
                                        )),
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
            child: RotatedBox(
              quarterTurns: 3,
              child: TabBar(
                controller: dashboardController.tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: Theme.of(context).tabBarTheme.indicator,
                indicatorColor: Theme.of(context).tabBarTheme.indicatorColor,
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
            ),
          ),
        ],
      ),
    );
  }
}
