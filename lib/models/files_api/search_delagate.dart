import 'package:blazedcloud/pages/files/search_item.dart';
import 'package:blazedcloud/utils/files_utils.dart';
import 'package:flutter/material.dart';

class FileSearchDelegate extends SearchDelegate {
  final List<String> keys;

  FileSearchDelegate(this.keys);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return fileSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return fileSearchResults();
  }

  ListView fileSearchResults() {
    return ListView(
      children: [
        ...fuzzySearch(query, keys).map(
            (e) => SearchItem(key: Key(e), fileKey: getStartingDirectory() + e))
      ],
    );
  }
}
