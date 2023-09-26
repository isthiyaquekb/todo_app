import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/AppAssets/app_assets.dart';
import 'package:todo_app/constants/Colors/app_colors.dart';
import 'package:todo_app/controllers/dashboard_controller.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/widgets/common_container_button.dart';

class CreateTask extends StatelessWidget {
  CreateTask({super.key});

  final taskController = Get.find<TaskController>();
  final dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(
                    AppAssets.backIcon,
                    height: 24,
                    width: 24,
                    color: dashboardController.isDarkMode.value
                        ? AppColors.primaryColorLight
                        : AppColors.primaryColorDark,
                  )),
              const SizedBox(
                height: 40,
              ),
              Text("Create New Task",
                  style: Theme.of(context).textTheme.displayMedium),
              const SizedBox(
                height: 40,
              ),
              Form(
                key: taskController.taskFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                controller: taskController.taskEditController,
                style:Theme.of(context).textTheme.titleMedium,
                decoration: InputDecoration(
                    hintText: "Enter your task here",
                    hintStyle: Theme.of(context).textTheme.titleMedium,
                    hintMaxLines: 2,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: AppColors.borderColors, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: AppColors.borderColors, width: 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: AppColors.borderColors, width: 1),
                    )),
                    validator: (validate){
                  return taskController.isTaskValidator(validate.toString());
                    },
              )),
              const SizedBox(
                height: 10,
              ),
              Obx(() => InkWell(
                    onTap: () {
                      taskController.pickDate(context);
                    },
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 8.0),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.amber.shade50,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: AppColors.borderColors, width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(AppAssets.calenderIcon,
                                color: Colors.amber),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                              taskController.selectedDate.value.isNotEmpty?taskController.selectedDate.value:"Pick a date",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => InkWell(
                  onTap: () {
                    taskController.pickTime(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 8.0),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.red.shade50,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColors.borderColors, width: 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(AppAssets.timeIcon,
                                  color: Colors.red),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              taskController.selectedFromTime.value.isNotEmpty?taskController.selectedFromTime.value:"From",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 8.0),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.red.shade50,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColors.borderColors, width: 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(AppAssets.timeIcon,
                                  color: Colors.red),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              taskController.selectedToTime.value.isNotEmpty?taskController.selectedToTime.value:"To",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => InkWell(
                  onTap: () {
                    taskController.expandBox();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: taskController.isExpanded.value
                          ? const Border(
                              right: BorderSide(
                                color: AppColors.borderColors,
                                width: 1.0,
                              ),
                              left: BorderSide(
                                color: AppColors.borderColors,
                                width: 1.0,
                              ),
                              top: BorderSide(
                                color: AppColors.borderColors,
                                width: 1.0,
                              ),
                              bottom: BorderSide(
                                color: AppColors.borderColors,
                                width: 0.0,
                              ),
                            )
                          : Border.all(color: AppColors.borderColors),
                      borderRadius: taskController.isExpanded.value
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10))
                          : BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color:
                                      AppColors.purpleColors.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: AppColors.borderColors, width: 1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                      taskController.taskType.value == "Work"
                                          ? AppAssets.workIcon
                                          :taskController.taskType.value == "Self care"
                                          ?AppAssets.selfCardIcon :AppAssets.familyIcon,
                                      color: Colors.deepPurple),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  taskController.taskType.value,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ],
                          ),
                          taskController.isExpanded.value
                              ? SvgPicture.asset(
                                  AppAssets.arrowDownIcon,
                                  height: 24,
                                  width: 24,
                                  color: dashboardController.isDarkMode.value
                                      ? AppColors.primaryColorLight
                                      : AppColors.primaryColorDark,
                                )
                              : SvgPicture.asset(
                                  AppAssets.arrowForwardIcon,
                                  height: 24,
                                  width: 24,
                                  color: dashboardController.isDarkMode.value
                                      ? AppColors.primaryColorLight
                                      : AppColors.primaryColorDark,
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => taskController.isExpanded.value
                    ? InkWell(
                        onTap: () {
                          taskController.expandBox();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: taskController.isExpanded.value
                                ? const Border(
                                    right: BorderSide(
                                      color: AppColors.borderColors,
                                      width: 1.0,
                                    ),
                                    left: BorderSide(
                                      color: AppColors.borderColors,
                                      width: 1.0,
                                    ),
                                    top: BorderSide(
                                      color: AppColors.borderColors,
                                      width: 0.0,
                                    ),
                                    bottom: BorderSide(
                                      color: AppColors.borderColors,
                                      width: 1.0,
                                    ),
                                  )
                                : Border.all(color: AppColors.borderColors),
                            borderRadius: taskController.isExpanded.value
                                ? const BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10))
                                : BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    taskController.setTaskType("Work");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: AppColors.purpleColors
                                              .withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: AppColors.borderColors,
                                              width: 1),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                              AppAssets.workIcon,
                                              color: Colors.deepPurple),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          "Work",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    taskController.setTaskType("Self care");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: AppColors.purpleColors
                                              .withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: AppColors.borderColors,
                                              width: 1),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                              AppAssets.selfCardIcon,
                                              color: Colors.deepPurple),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          "Self care",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    taskController.setTaskType("Family");
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: AppColors.purpleColors
                                              .withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: AppColors.borderColors,
                                              width: 1),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                              AppAssets.familyIcon,
                                              color: Colors.deepPurple),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          "Family",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColors),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.cyan.shade50,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColors.borderColors, width: 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                AppAssets.bellIcon,
                                color: Colors.cyan,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text(
                              "Remind me",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                      /*ToggleSwitch(
                        minWidth: 50.0,
                        minHeight: 30.0,
                        initialLabelIndex: 0,
                        cornerRadius: 10.0,
                        activeFgColor: Colors.cyan,
                        inactiveBgColor: Colors.grey.shade50,
                        inactiveFgColor: Colors.black,
                        totalSwitches: 2,
                        icons: [
                          CupertinoIcons.bell,
                          CupertinoIcons.bell_slash,
                        ],
                        iconSize: 24.0,
                        activeBgColors: [[Colors.cyan.shade100, Colors.cyan.shade50], [Colors.red.shade50, Colors.red.shade100]],
                        animate: true, // with just animate set to true, default curve = Curves.easeIn
                        curve: Curves.linearToEaseOut, // animate must be set to true when using custom curve
                        onToggle: (index) {
                          print('switched to: $index');
                        },
                      )*/
                      Obx(
                        () => CupertinoSwitch(
                            value: taskController.reminderOn.value,
                            onChanged: (changeValue) {
                            taskController.reminderOn.value=changeValue;
                            }),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CommonContainerButton(tap: taskController.isValid,)
            ],
          ),
        ),
      ),
    );
  }
}
