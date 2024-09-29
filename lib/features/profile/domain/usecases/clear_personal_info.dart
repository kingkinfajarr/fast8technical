import '../repositories/profile_repository.dart';

class ClearPersonalInfo {
  final ProfileRepository repository;

  ClearPersonalInfo(this.repository);

  Future<void> call() async {
    return await repository.clearPersonalInfo();
  }
}
