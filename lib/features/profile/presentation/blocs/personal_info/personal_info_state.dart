part of 'personal_info_bloc.dart';

@immutable
sealed class PersonalInfoState {}

final class PersonalInfoInitial extends PersonalInfoState {}

final class PersonalInfoLoading extends PersonalInfoState {}

final class SavePersonalInfoSuccess extends PersonalInfoState {
  final PersonalInfo info;
  SavePersonalInfoSuccess(this.info);
}

final class PersonalInfoSuccess extends PersonalInfoState {
  final PersonalInfo info;
  PersonalInfoSuccess(this.info);
}

final class PersonalInfoCleared extends PersonalInfoState {}

final class PersonalInfoError extends PersonalInfoState {
  final String message;
  PersonalInfoError(this.message);
}
