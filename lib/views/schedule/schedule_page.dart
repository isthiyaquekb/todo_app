import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/constants/AppAssets/app_assets.dart';
import 'package:todo_app/constants/Colors/app_colors.dart';
import 'package:todo_app/controllers/dashboard_controller.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/widgets/task_card_container.dart';

class SchedulePage extends StatelessWidget {
  SchedulePage({super.key});
  final taskController = Get.find<TaskController>();
  final dashboardController = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(onTap: (){
                  Get.back();
                },child: SvgPicture.asset(
                  AppAssets.backIcon,
                  height: 24,
                  width: 24,
                  color: dashboardController.isDarkMode.value
                      ? AppColors.primaryColorLight
                      : AppColors.primaryColorDark,
                )),
                SvgPicture.asset(AppAssets.menu,color: AppColors.white,)
              ],
            ),
            SizedBox(height: 24,),
            Text("Schedule",style: Theme.of(context).textTheme.displayLarge,),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor),
              child: TabBar(
                controller: taskController.tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: Theme.of(context).tabBarTheme.indicator,
                indicatorColor:
                Theme.of(context).tabBarTheme.indicatorColor,
                labelColor: Theme.of(context).tabBarTheme.labelColor,
                isScrollable: false,
                unselectedLabelColor:
                Theme.of(context).tabBarTheme.unselectedLabelColor,
                unselectedLabelStyle:
                Theme.of(context).tabBarTheme.unselectedLabelStyle,
                tabs: [
                  Tab(child: Align(
                    alignment: Alignment.center,
                    child: Text("Week"),
                  ),),
                  Tab(child: Align(
                    alignment: Alignment.center,
                    child: Text("Month"),
                  ),),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              child: TabBarView(
                controller: taskController.tabController,
                children: [
                  TabBar(
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
                  TabBar(
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
                    tabs: dashboardController.myMonth,
                    onTap: (int index) {
                      dashboardController.changeMonthTabIndex(index);
                    },
                  ),
                ],
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
                                      tap: () =>(),
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
                                  tap: () =>(),
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
                                  tap: () =>(),
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
                                  tap: () =>(),
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
                                  tap: () =>(),
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
                                  tap: () =>(),
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
                                  tap: () =>(),
                                ),
                              )),
                        ),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
