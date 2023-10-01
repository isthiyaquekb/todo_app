import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/controllers/dashboard_controller.dart';

import '../constants/colors/app_colors.dart';

class TaskCardContainer extends StatelessWidget {
  final String title;
  final String date;
  final String startTime;
  final String endDate;
  final Color colorBg;
  final Function() tap;
  const TaskCardContainer({super.key,required this.colorBg,required this.title,required this.date,required this.startTime,required this.endDate, required this.tap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:tap,
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: colorBg,
            borderRadius:
            BorderRadius.circular(
                10),
            border: Border.all(
                color: AppColors
                    .borderColors)),
        child: Padding(
          padding: const EdgeInsets
              .symmetric(
              vertical: 16.0,
              horizontal: 8.0),
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment
                .spaceBetween,
            crossAxisAlignment:
            CrossAxisAlignment
                .start,
            children: [
              Text(
               title,
                style: Theme.of(
                    context)
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
                        .format(DateTime.parse(date)),
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
                        DateFormat.jm().format(DateTime.parse(startTime)),
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
                        DateFormat.jm().format(DateTime.parse(endDate)),
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
      ),
    );
  }
}
