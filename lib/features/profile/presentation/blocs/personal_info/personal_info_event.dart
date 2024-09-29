part of 'personal_info_bloc.dart';

@immutable
sealed class PersonalInfoEvent {}

class SavePersonalInfoEvent extends PersonalInfoEvent {
  final PersonalInfo info;
  SavePersonalInfoEvent(this.info);
}

class GetPersonalInfoEvent extends PersonalInfoEvent {}

class ClearPersonalInfoEvent extends PersonalInfoEvent {}
