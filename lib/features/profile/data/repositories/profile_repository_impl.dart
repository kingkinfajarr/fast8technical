import '../../domain/entities/personal_info_entity.dart';
import '../datasources/profile_local_datasource.dart';
import '../models/personal_info_model.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileLocalDataSource localDataSource;

  ProfileRepositoryImpl(this.localDataSource);

  @override
  Future<void> savePersonalInfo(PersonalInfo info) async {
    final model = PersonalInfoModel(
      id: info.id,
      name: info.name,
      dateOfBirth: info.dateOfBirth,
      gender: info.gender,
      email: info.email,
      phoneNumber: info.phoneNumber,
      education: info.education,
      maritalStatus: info.maritalStatus,

      //step 2
      nik: info.nik,
      address: info.address,
      province: info.province,
      city: info.city,
      district: info.district,
      village: info.village,
      postalCode: info.postalCode,
      ktpImagePath: info.ktpImagePath,

      //step 3
      companyName: info.companyName,
      companyAddress: info.companyAddress,
      position: info.position,
      workDuration: info.workDuration,
      income: info.income,
      grossIncomeYearly: info.grossIncomeYearly,
      bankName: info.bankName,
      bankBranch: info.bankBranch,
      accountNumber: info.accountNumber,
      accountName: info.accountName,
    );
    await localDataSource.savePersonalInfo(model.toJson());
  }

  @override
  Future<PersonalInfo> getPersonalInfo() async {
    final data = await localDataSource.getPersonalInfo();
    final model = PersonalInfoModel.fromJson(data);
    return PersonalInfo(
      name: model.name,
      dateOfBirth: model.dateOfBirth,
      gender: model.gender,
      email: model.email,
      phoneNumber: model.phoneNumber,
      education: model.education,
      maritalStatus: model.maritalStatus,

      //step 2
      nik: model.nik,
      address: model.address,
      province: model.province,
      city: model.city,
      district: model.district,
      village: model.village,
      postalCode: model.postalCode,
      ktpImagePath: model.ktpImagePath,

      //step 3
      companyName: model.companyName,
      companyAddress: model.companyAddress,
      position: model.position,
      workDuration: model.workDuration,
      income: model.income,
      grossIncomeYearly: model.grossIncomeYearly,
      bankName: model.bankName,
      bankBranch: model.bankBranch,
      accountNumber: model.accountNumber,
      accountName: model.accountName,
    );
  }

  @override
  Future<void> clearPersonalInfo() async {
    await localDataSource.clearPersonalInfo();
  }
}
