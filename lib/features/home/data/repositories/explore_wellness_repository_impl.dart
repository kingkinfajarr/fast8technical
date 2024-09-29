import '../../domain/entities/explore_wellness_entity.dart';
import '../../domain/repositories/explore_wellness_repository.dart';
import '../data_sources/explore_wellness_datasources.dart';

class ExploreWellnessRepositoryImpl implements ExploreWellnessRepository {
  final ExploreWellnessDataSource dataSource;

  ExploreWellnessRepositoryImpl(this.dataSource);

  @override
  Future<List<ExploreWellnessEntity>> getExploreWellnessItems() async {
    final models = await dataSource.fetchExploreData();
    return models
        .map((model) => ExploreWellnessEntity(
              id: model.id,
              title: model.title,
              price: model.price,
              discountPct: model.discountPct,
              discountPrice: model.discountPrice,
            ))
        .toList();
  }
}
