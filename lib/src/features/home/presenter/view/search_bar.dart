import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zillow_mini/src/core/presenter/extensions/context_extensions.dart';
import 'package:zillow_mini/src/features/filters/domain/filters.dart';
import 'package:zillow_mini/src/features/filters/presenter/view_model/filters_view_model.dart';


class AppSearchBar extends StatefulWidget {
  const AppSearchBar({super.key, required this.onSearch});
  final ValueChanged<String> onSearch;

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {

  final TextEditingController _searchController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch() {
    final query = _searchController.text.trim();
    widget.onSearch(query);
    _focusNode.unfocus();
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<FiltersViewModel, Filters>(
      listener: (context, filters) {
        if(filters.query == null){
          _searchController.clear();
          _focusNode.unfocus();
        }

      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow.withValues(alpha: 0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                focusNode: _focusNode,
                controller: _searchController,
                textInputAction: TextInputAction.search,
                decoration:  InputDecoration(
                  hintText: context.l10n.searchYourProperty,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                ),
                onSubmitted: (_) => _performSearch(),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: IconButton(
                icon:  Icon(Icons.search, color: Theme.of(context).colorScheme.onPrimary),
                onPressed: _performSearch,
                tooltip: context.l10n.search,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

