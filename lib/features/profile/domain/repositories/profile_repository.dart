import '../entities/personal_info_entity.dart';

abstract class ProfileRepository {
  Future<void> savePersonalInfo(PersonalInfo info);
  Future<PersonalInfo> getPersonalInfo();
  Future<void> clearPersonalInfo();
}
