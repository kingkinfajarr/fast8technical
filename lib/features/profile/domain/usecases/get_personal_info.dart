import '../entities/personal_info_entity.dart';
import '../repositories/profile_repository.dart';

class GetPersonalInfo {
  final ProfileRepository repository;

  GetPersonalInfo(this.repository);

  Future<PersonalInfo> call() async {
    return await repository.getPersonalInfo();
  }
}
