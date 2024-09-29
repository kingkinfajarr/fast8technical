import '../entities/explore_wellness_entity.dart';
import '../repositories/explore_wellness_repository.dart';

class GetExploreWellnessUc {
  final ExploreWellnessRepository repository;

  GetExploreWellnessUc(this.repository);

  Future<List<ExploreWellnessEntity>> call() {
    return repository.getExploreWellnessItems();
  }
}
