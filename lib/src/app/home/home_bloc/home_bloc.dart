import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_trainings_app/src/app/home/home_bloc/home_event.dart';
import 'package:my_trainings_app/src/app/home/home_bloc/home_state.dart';
import 'package:my_trainings_app/src/app/home/model/fitness_info.dart';

class TrainingBloc extends Bloc<TrainingEvent, TrainingState> {
  List<Fitness> fitnessData = [
    Fitness(
      id: "0",
      time: "08:30 am - 12:30 pm",
      location: "West Des Moines",
      date: "Oct 11 - 13, 2019",
      trainingName: "Safe Scrum Master (4.6)",
      trainer: "Keynote Speaker",
      details: "Helen Gribble",
    ),
    Fitness(
      id: "1",
      time: "07:00 am - 11:00 am",
      location: "Chicago, IL",
      date: "Nov 5 - 7, 2019",
      trainingName: "Strength and Conditioning",
      trainer: "John Doe",
      details: "Certified Fitness Coach",
    ),
    Fitness(
      id: "2",
      time: "09:00 am - 01:00 pm",
      location: "Phoenix, AZ",
      date: "Dec 1 - 3, 2019",
      trainingName: "HIIT Bootcamp",
      trainer: "Jane Smith",
      details: "High-Intensity Specialist",
    ),
    Fitness(
      id: "3",
      time: "08:00 am - 12:00 pm",
      location: "Dallas, TX",
      date: "Jan 10 - 12, 2020",
      trainingName: "CrossFit Fundamentals",
      trainer: "Mike Johnson",
      details: "CrossFit Level 2 Coach",
    ),
    Fitness(
      id: "4",
      time: "06:30 am - 11:30 am",
      location: "San Diego, CA",
      date: "Feb 15 - 17, 2020",
      trainingName: "Yoga and Wellness Retreat",
      trainer: "Sarah Williams",
      details: "Certified Yoga Instructor",
    ),
    Fitness(
      id: "5",
      time: "10:00 am - 02:00 pm",
      location: "San Francisco, CA",
      date: "Mar 20 - 22, 2020",
      trainingName: "Functional Strength Training",
      trainer: "David Brown",
      details: "Strength Coach & Nutritionist",
    ),
    Fitness(
      id: "6",
      time: "07:30 am - 12:30 pm",
      location: "New York, ZK",
      date: "Apr 5 - 7, 2020",
      trainingName: "Endurance Training Camp",
      trainer: "Laura Miller",
      details: "Marathon Coach",
    )
  ];

  TrainingBloc() : super(TrainingInitial()) {
    on<LoadTrainings>((event, emit) {
      emit(TrainingLoaded(fitnessData));
    });

    on<FilterTrainings>((event, emit) {
      List<Fitness> filtered = [];
      if (event.location.isNotEmpty) {
        for (var element in event.location) {
          filtered.addAll(fitnessData.where((data) {
            return data.location.contains(element);
          }));
          fitnessData = filtered.toSet().toList();
        }
      }
      if (event.name != "") {
        filtered.addAll(fitnessData.where((data) {
          return data.trainingName.contains(event.name);
        }));
        fitnessData = filtered.toSet().toList();
      }
      if (event.trainer != "") {
        filtered.addAll(fitnessData.where((data) {
          return data.trainer.contains(event.trainer);
        }));
        fitnessData = filtered.toSet().toList();
      }

      emit(TrainingLoaded(filtered));
    });

    on<ClearFilter>((event, emit) {
      emit(TrainingLoaded(fitnessData));
    });

    on<CarousalSliderEvent>((event, emit) {
      List<String> imageList = [
        "assets/banner1.jpg",
        "assets/banner2.jpg",
        "assets/banner3.jpg",
      ];
      emit(CarousalSliderState(imageList));
    });
  }
}
