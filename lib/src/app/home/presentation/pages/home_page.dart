// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_trainings_app/src/app/home/controller/home_controller.dart';
import 'package:my_trainings_app/src/app/home/presentation/pages/trainer_details_page.dart';
import 'package:my_trainings_app/src/app/home/presentation/widgets/fitness_widget.dart';
import 'package:my_trainings_app/src/common/constant/font_helper.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (_) {
        return SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 400.h,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Container(
                          height: 250.h,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              20.h.verticalSpace,
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Trainings",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: FontFamily.openSansBold,
                                        fontSize: 30.sp,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              60.h.verticalSpace,
                              Text(
                                "Highlights",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: FontFamily.openSansBold,
                                  fontSize: 20.sp,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFfe4855),
                          ),
                        ),
                        Container(
                          height: 150.h,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.filterData(context);
                                },
                                child: Container(
                                  height: 35.h,
                                  width: 78.w,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.sp),
                                  margin: EdgeInsets.only(left: 10.sp),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      controller.isFilter
                                          ? Icon(
                                              Icons.close,
                                              color: Colors.grey,
                                              size: 17.sp,
                                            )
                                          : Image.asset(
                                              "assets/filter.png",
                                              height: 15.h,
                                              width: 15.w,
                                              color: Colors.grey,
                                            ),
                                      5.w.horizontalSpace,
                                      Text(
                                        controller.isFilter
                                            ? "Clear"
                                            : "Filter",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: FontFamily.openSansMedium,
                                          fontSize: 14.sp,
                                        ),
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.sp),
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                  ),
                                ),
                              ),
                              20.h.verticalSpace,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 80.h,
                    left: 0,
                    right: 0,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 160.h,
                          width: MediaQuery.of(context).size.width,
                          child: PageView.builder(
                            controller: controller.pageController,
                            itemCount: controller.imageList.length,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (value) {
                              controller.onSwipeToChangeCurrentIndex(value);
                            },
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 40.sp),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.sp),
                                  image: DecorationImage(
                                    image: AssetImage(controller
                                        .imageList[controller.currentIndex]),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 35.h,
                          bottom: 35.h,
                          child: GestureDetector(
                            onTap: () {
                              controller.decrementIndex();
                            },
                            child: Container(
                              height: 50.h,
                              width: 30.h,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                size: 17.sp,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4.sp),
                                  bottomRight: Radius.circular(4.sp),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 35.h,
                          bottom: 35.h,
                          child: GestureDetector(
                            onTap: () {
                              controller.incrementIndex();
                            },
                            child: Container(
                              height: 50.sp,
                              width: 30.sp,
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 17.sp,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.sp),
                                  bottomLeft: Radius.circular(4.sp),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              5.h.verticalSpace,
              Expanded(
                child: ListView.builder(
                  itemCount: controller.fitnessList.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    var fitness = controller.fitnessList[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          TrainerDetailesPage(
                            index: index,
                          ),
                        );
                      },
                      child: FitnessWidget(
                        fitness: fitness,
                        index: index,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
