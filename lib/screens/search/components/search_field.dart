import 'package:firestore_search/firestore_search.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FirestoreSearchBar(
      tag: 'all',
    );
  }
}
