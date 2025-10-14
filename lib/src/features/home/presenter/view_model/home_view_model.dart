import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:zillow_mini/src/core/domain/models/property.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zillow_mini/src/core/domain/repo/property_repo.dart';
import 'package:zillow_mini/src/core/presenter/models/property_ui.dart';

class HomeViewModel extends Cubit<PagingState<int, PropertyUI>> {
  HomeViewModel(this._repo) : super(PagingState()) {
    pagingController.addListener(_updateState);
  }

  final PropertyRepo _repo;

  late final pagingController = PagingController<int, PropertyUI>(
    getNextPageKey: (state) => state.lastPageIsEmpty ? null : state.nextIntPageKey,
    fetchPage: (pageKey) async => (await _repo.getProperties(page: pageKey, limit: 10)).map((_toUI)).toList(),
  );

  PropertyUI _toUI(Property property) => PropertyUI.fromDomain(property);

  void _updateState() {
    emit(pagingController.value);
  }

  @override
  Future<void> close() {
    pagingController.removeListener(_updateState);
    pagingController.dispose();
    return super.close();
  }
}
