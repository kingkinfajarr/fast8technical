part of 'get_explore_wellness_bloc.dart';

@immutable
sealed class GetExploreWellnessEvent {}

class LoadExploreWellnessItems extends GetExploreWellnessEvent {}

class SortExploreWellnessItems extends GetExploreWellnessEvent {
  final String filter;

  SortExploreWellnessItems(this.filter);
}
