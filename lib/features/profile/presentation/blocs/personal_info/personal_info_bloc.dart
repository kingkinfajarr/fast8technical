import 'package:fast8technical/features/profile/domain/usecases/clear_personal_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../../domain/entities/personal_info_entity.dart';
import '../../../domain/usecases/get_personal_info.dart';
import '../../../domain/usecases/save_personal_info.dart';

part 'personal_info_event.dart';
part 'personal_info_state.dart';

class PersonalInfoBloc extends Bloc<PersonalInfoEvent, PersonalInfoState> {
  final SavePersonalInfo savePersonalInfoUseCase;
  final GetPersonalInfo getPersonalInfoUseCase;
  final ClearPersonalInfo clearPersonalInfoUseCase;

  PersonalInfoBloc({
    required this.savePersonalInfoUseCase,
    required this.getPersonalInfoUseCase,
    required this.clearPersonalInfoUseCase,
  }) : super(PersonalInfoInitial()) {
    final logger = Logger(
      printer: PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 50,
        colors: false,
        printEmojis: true,
      ),
    );

    on<SavePersonalInfoEvent>((event, emit) async {
      try {
        await savePersonalInfoUseCase(event.info);

        logger.i('Personal info saved successfully');
        emit(SavePersonalInfoSuccess(event.info));
      } catch (e) {
        logger.e(e.toString());
        emit(PersonalInfoError(e.toString()));
      }
    });

    on<GetPersonalInfoEvent>((event, emit) async {
      try {
        final info = await getPersonalInfoUseCase();

        logger.i('Personal info fetched successfully');
        emit(PersonalInfoSuccess(info));
      } catch (e) {
        logger.e(e.toString());
        emit(PersonalInfoError(e.toString()));
      }
    });

    on<ClearPersonalInfoEvent>((event, emit) async {
      try {
        await clearPersonalInfoUseCase();

        logger.i('Personal info cleared successfully');
        emit(PersonalInfoCleared());
      } catch (e) {
        logger.e(e.toString());
        emit(PersonalInfoError(e.toString()));
      }
    });
  }
}
