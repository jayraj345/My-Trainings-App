  import 'package:my_trainings_app/src/app/home/model/fitness_info.dart';
import 'package:my_trainings_app/src/app/home/model/trainer_event_model.dart';

abstract class TrainingState {}

class TrainingInitial extends TrainingState {}

class TrainingLoaded extends TrainingState {
  final List<Fitness> trainings;

  TrainingLoaded(this.trainings);
}
class CarousalSliderState extends TrainingState {
  final List<String> sliderImages;

  CarousalSliderState(this.sliderImages);
}