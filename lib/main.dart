import 'package:fast8technical/features/home/presentation/blocs/get_explore_wellness/get_explore_wellness_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fast8technical/cores/constants/app_routes.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'features/home/data/data_sources/explore_wellness_datasources.dart';
import 'features/home/data/repositories/explore_wellness_repository_impl.dart';
import 'features/home/domain/usecases/get_explore_wellness_uc.dart';
import 'features/profile/data/datasources/profile_local_datasource.dart';
import 'features/profile/data/repositories/profile_repository_impl.dart';
import 'features/profile/domain/usecases/clear_personal_info.dart';
import 'features/profile/domain/usecases/get_personal_info.dart';
import 'features/profile/domain/usecases/save_personal_info.dart';
import 'features/profile/presentation/blocs/personal_info/personal_info_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = await openDatabase(
    join(await getDatabasesPath(), 'profile_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE personal_info(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, dateOfBirth TEXT, gender TEXT, email TEXT, phoneNumber TEXT, education TEXT, maritalStatus TEXT, nik TEXT, address TEXT, province TEXT, city TEXT, district TEXT, village TEXT, postalCode TEXT, ktpImagePath TEXT, companyName TEXT, companyAddress TEXT, position TEXT, workDuration TEXT, income TEXT, grossIncomeYearly TEXT, bankName TEXT, bankBranch TEXT, accountNumber TEXT, accountName TEXT)',
      );
    },
    version: 1,
  );

  runApp(MyApp(database: database));
}

class MyApp extends StatelessWidget {
  final Database database;

  const MyApp({super.key, required this.database});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetExploreWellnessBloc(
            GetExploreWellnessUc(
              ExploreWellnessRepositoryImpl(ExploreWellnessDataSourceImpl()),
            ),
          )..add(
              LoadExploreWellnessItems(),
            ),
        ),
        BlocProvider(
          create: (context) {
            final localDataSource = ProfileLocalDataSource(database);
            final repository = ProfileRepositoryImpl(localDataSource);
            return PersonalInfoBloc(
              savePersonalInfoUseCase: SavePersonalInfo(repository),
              getPersonalInfoUseCase: GetPersonalInfo(repository),
              clearPersonalInfoUseCase: ClearPersonalInfo(repository),
            );
          },
        ),
      ],
      child: MaterialApp(
        title: 'Fast8 Technical',
        theme: ThemeData(),
        initialRoute: '/',
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}
