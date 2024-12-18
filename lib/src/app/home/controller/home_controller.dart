import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trainings_app/src/app/home/model/fitness_info.dart';
import 'package:my_trainings_app/src/app/home/presentation/widgets/bottom_sheet.dart';

class HomeController extends GetxController implements GetxService {
  PageController pageController = PageController(initialPage: 0);
  List<String> imageList = [
    "assets/banner1.jpg",
    "assets/banner2.jpg",
    "assets/banner3.jpg",
  ];
  int currentIndex = 0;
  int selectedFilter = 0;

  List<Fitness> fitnessList = [];
  List<Fitness> filterList = [];

  List<String> filteredLocation = [];
  String trainingName = "";
  String trainer = "";

  bool isFilter = false;

  List<Map<String, dynamic>> dummyData = [
    {
      "id": "0",
      "time": "08:30 am - 12:30 pm",
      "location": "West Des Moines",
      "date": "Oct 11 - 13, 2019",
      "trainingName": "Safe Scrum Master (4.6)",
      "trainer": "Keynote Speaker",
      "details": "Helen Gribble"
    },
    {
      "id": "1",
      "time": "07:00 am - 11:00 am",
      "location": "Chicago, IL",
      "date": "Nov 5 - 7, 2019",
      "trainingName": "Strength and Conditioning",
      "trainer": "John Doe",
      "details": "Certified Fitness Coach"
    },
    {
      "id": "2",
      "time": "09:00 am - 01:00 pm",
      "location": "Phoenix, AZ",
      "date": "Dec 1 - 3, 2019",
      "trainingName": "HIIT Bootcamp",
      "trainer": "Jane Smith",
      "details": "High-Intensity Specialist"
    },
    {
      "id": "3",
      "time": "08:00 am - 12:00 pm",
      "location": "Dallas, TX",
      "date": "Jan 10 - 12, 2020",
      "trainingName": "CrossFit Fundamentals",
      "trainer": "Mike Johnson",
      "details": "CrossFit Level 2 Coach"
    },
    {
      "id": "4",
      "time": "06:30 am - 11:30 am",
      "location": "San Diego, CA",
      "date": "Feb 15 - 17, 2020",
      "trainingName": "Yoga and Wellness Retreat",
      "trainer": "Sarah Williams",
      "details": "Certified Yoga Instructor"
    },
    {
      "id": "5",
      "time": "10:00 am - 02:00 pm",
      "location": "San Francisco, CA",
      "date": "Mar 20 - 22, 2020",
      "trainingName": "Functional Strength Training",
      "trainer": "David Brown",
      "details": "Strength Coach & Nutritionist"
    },
    {
      "id": "6",
      "time": "07:30 am - 12:30 pm",
      "location": "New York, ZK",
      "date": "Apr 5 - 7, 2020",
      "trainingName": "Endurance Training Camp",
      "trainer": "Laura Miller",
      "details": "Marathon Coach"
    }
  ];

  addData() {
    fitnessList.clear();
    filterList.clear();
    for (var element in dummyData) {
      fitnessList.add(Fitness.fromJson(element));
      filterList.add(Fitness.fromJson(element));
    }
    update();
  }

  void navigateToPage(int index) {
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  filterData(BuildContext context) {
    List<Fitness> filteredData = [];
    if (isFilter) {
      filteredLocation.clear();
      trainingName = "";
      trainer = "";
      selectedFilter = 0;
      addData();
      isFilter = false;
      update();
    } else {
      showFilterBottomSheet(context).then((value) {
        if (filteredLocation.isNotEmpty ||
            trainingName != "" ||
            trainer != "") {
          isFilter = true;
          update();
        } else {
          addData();
          isFilter = false;
          update();
        }

        if (filteredLocation.isNotEmpty) {
          for (var element in filteredLocation) {
            filteredData.addAll(filterList.where((data) {
              return data.location.contains(element);
            }));
            fitnessList = filteredData.toSet().toList();
          }
        }
        if (trainingName != "") {
          filteredData.addAll(filterList.where((data) {
            return data.trainingName.contains(trainingName);
          }));
          fitnessList = filteredData.toSet().toList();
        }
        if (trainer != "") {
          filteredData.addAll(filterList.where((data) {
            return data.trainer.contains(trainer);
          }));
          fitnessList = filteredData.toSet().toList();
        }
      });
    }
  }

  bool checkBoxValue(int index) {
    return selectedFilter == 0
        ? filteredLocation.contains(fitnessList[index].location)
            ? true
            : false
        : selectedFilter == 1
            ? trainingName == fitnessList[index].trainingName
                ? true
                : false
            : selectedFilter == 2
                ? trainer == fitnessList[index].trainer
                    ? true
                    : false
                : false;
  }

  filterInOut(int index) {
    if (selectedFilter == 0) {
      if (filteredLocation.contains(fitnessList[index].location)) {
        filteredLocation.remove(fitnessList[index].location);
      } else {
        filteredLocation.add(fitnessList[index].location);
      }
    } else if (selectedFilter == 1) {
      trainingName = fitnessList[index].trainingName;
    } else {
      trainer = fitnessList[index].trainer;
    }
    update();
  }

  // decrement and increment
  decrementIndex() {
    if (currentIndex != 0) {
      currentIndex--;
      navigateToPage(currentIndex);
      update();
    }
  }

  incrementIndex() {
    if (imageList.length - 1 > currentIndex) {
      currentIndex++;
      navigateToPage(currentIndex);
      update();
    }
  }

  onSwipeToChangeCurrentIndex(int index) {
    currentIndex = index;
    update();
  }

  @override
  void onInit() {
    addData();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
