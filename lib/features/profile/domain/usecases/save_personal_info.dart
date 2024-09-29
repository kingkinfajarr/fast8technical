import '../entities/personal_info_entity.dart';
import '../repositories/profile_repository.dart';

class SavePersonalInfo {
  final ProfileRepository repository;

  SavePersonalInfo(this.repository);

  Future<void> call(PersonalInfo info) async {
    await repository.savePersonalInfo(info);
  }
}
