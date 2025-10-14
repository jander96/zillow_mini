import 'package:flutter/material.dart';


class AppSearchBar extends StatefulWidget {
  const AppSearchBar({super.key, required this.onSearch});
  final ValueChanged<String> onSearch;

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {

  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch() {
    final query = _searchController.text.trim();

    widget.onSearch(query);

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
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
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search your property',
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
              tooltip: 'Search',
            ),
          ),
        ],
      ),
    );
  }
}

