part of 'get_explore_wellness_bloc.dart';

@immutable
sealed class GetExploreWellnessState {}

final class GetExploreWellnessInitial extends GetExploreWellnessState {}

final class GetExploreWellnessLoading extends GetExploreWellnessState {}

final class GetExploreWellnessSuccess extends GetExploreWellnessState {
  final List<ExploreWellnessEntity> exploreWellnessItems;

  GetExploreWellnessSuccess(this.exploreWellnessItems);
}

final class GetExploreWellnessFailure extends GetExploreWellnessState {
  final String message;

  GetExploreWellnessFailure(this.message);
}
