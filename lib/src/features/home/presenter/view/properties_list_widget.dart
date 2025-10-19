import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:zillow_mini/src/core/data/app_error.dart';
import 'package:zillow_mini/src/core/data/error_handler.dart';
import 'package:zillow_mini/src/core/presenter/extensions/error_extensions.dart';
import 'package:zillow_mini/src/core/presenter/models/property_ui.dart';
import 'package:zillow_mini/src/core/presenter/widgets/empty_widget.dart';
import 'package:zillow_mini/src/core/presenter/widgets/error_widget.dart';
import 'package:zillow_mini/src/features/filters/domain/filters.dart';
import 'package:zillow_mini/src/features/filters/presenter/view_model/filters_view_model.dart';
import 'package:zillow_mini/src/features/home/presenter/view/property_card.dart';
import 'package:zillow_mini/src/core/presenter/extensions/context_extensions.dart';

class PropertiesListWidget extends StatefulWidget {
  const PropertiesListWidget({super.key, required this.pagingController, required this.onPropertyClick});

  final PagingController<int, PropertyUI> pagingController;
  final ValueChanged<PropertyUI> onPropertyClick;

  @override
  State<PropertiesListWidget> createState() => _PropertiesListWidgetState();
}

class _PropertiesListWidgetState extends State<PropertiesListWidget> with ErrorHandler {
  @override
  Widget build(BuildContext context) {
    return PagingListener(
      controller: widget.pagingController,
      builder: (context, state, fetchNextPage) => PagedSliverList<int, PropertyUI>.separated(
        state: state,
        fetchNextPage: fetchNextPage,
        builderDelegate: PagedChildBuilderDelegate(
          animateTransitions: true,
          itemBuilder: (context, property, index) => PropertyCard(propertyUI: property, onTap: widget.onPropertyClick),
          firstPageErrorIndicatorBuilder: (context) {
            late Widget child;
            switch (widget.pagingController.error!) {
              case DioException _:
                final appError = (widget.pagingController.error as DioException).toAppError();
                if (appError is NotFoundError) {
                  child = EmptyStateWidget(
                    title: context.l10n.noMatches,
                    message: appError.getMessage(context),
                    onClearFilters: () {
                      context.read<FiltersViewModel>().setFilters((filters) => Filters());
                    },
                  );
                } else {
                  child = ErrorStateWidget(
                    title: context.l10n.error,
                    message: appError.getMessage(context),
                    onRetry: () {
                      widget.pagingController.refresh();
                    },
                  );
                }
                break;
              default:
                child = ErrorStateWidget(
                  title: context.l10n.error,
                  message: context.l10n.errorUnknown,
                  onRetry: () {
                    widget.pagingController.refresh();
                  },
                );
            }
            return child;
          },
        ),
        separatorBuilder: (BuildContext context, int index) => SizedBox.square(dimension: 8),
      ),
    );
  }
}
