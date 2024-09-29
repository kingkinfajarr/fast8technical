import '../entities/explore_wellness_entity.dart';

abstract class ExploreWellnessRepository {
  Future<List<ExploreWellnessEntity>> getExploreWellnessItems();
}
