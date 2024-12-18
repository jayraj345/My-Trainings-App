abstract class TrainingEvent {}

class LoadTrainings extends TrainingEvent {}

class FilterTrainings extends TrainingEvent {
  final List<String> location;
  final String name;
  final String trainer;

  FilterTrainings({required this.location, required this.name, required this.trainer});
}

class ClearFilter extends TrainingEvent {}

class CarousalSliderEvent extends TrainingEvent {}


