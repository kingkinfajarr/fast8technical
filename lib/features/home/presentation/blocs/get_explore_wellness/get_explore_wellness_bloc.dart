import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../../domain/entities/explore_wellness_entity.dart';
import '../../../domain/usecases/get_explore_wellness_uc.dart';

part 'get_explore_wellness_event.dart';
part 'get_explore_wellness_state.dart';

class GetExploreWellnessBloc
    extends Bloc<GetExploreWellnessEvent, GetExploreWellnessState> {
  final GetExploreWellnessUc getExploreItems;
  List<ExploreWellnessEntity> _items = [];
  final logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 50,
      colors: false,
      printEmojis: true,
    ),
  );

  GetExploreWellnessBloc(this.getExploreItems)
      : super(GetExploreWellnessInitial()) {
    on<LoadExploreWellnessItems>((event, emit) async {
      emit(GetExploreWellnessLoading());

      try {
        logger.i('Fetching explore wellness data...');
        _items = await getExploreItems();

        logger.i('Data fetched successfully: ${_items.length} items');
        emit(GetExploreWellnessSuccess(_items));
      } catch (e) {
        logger.e(e.toString());
        emit(GetExploreWellnessFailure(e.toString()));
      }
    });

    on<SortExploreWellnessItems>((event, emit) {
      if (_items.isEmpty) return;

      List<ExploreWellnessEntity> sortedItems;

      switch (event.filter) {
        case 'cheap':
          sortedItems = List.from(_items);
          sortedItems.sort((a, b) => a.price.compareTo(b.price));
          break;
        case 'expensive':
          sortedItems = List.from(_items);
          sortedItems.sort((a, b) => b.price.compareTo(a.price));
          break;
        case 'ASC':
          sortedItems = List.from(_items);
          sortedItems.sort((a, b) => a.title.compareTo(b.title));
          break;
        case 'DESC':
          sortedItems = List.from(_items);
          sortedItems.sort((a, b) => b.title.compareTo(a.title));
          break;
        default:
          sortedItems = _items;
      }

      emit(GetExploreWellnessSuccess(sortedItems));
    });
  }
}
