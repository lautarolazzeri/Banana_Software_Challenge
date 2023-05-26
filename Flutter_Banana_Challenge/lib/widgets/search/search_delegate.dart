import 'package:app/constants/constants.dart';
import 'package:app/viewModels/products_viewmodel.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//search delegate
class SearchDelegateProducts extends SearchDelegate {

  //change the text of the search field
  @override
  String get searchFieldLabel => 'Buscar Productos';

  //X button to clear the search field
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  //back button
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back),
    );
  }

  //suggestions that appear when the user writes
  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Icon(Icons.search, size: 100, color: grey),
      );
    }

    final productsProvider = context.read<ProductViewModel>();

    return Consumer<ProductViewModel>(
      builder: (context, state, child) {
        productsProvider.searchByProduct(query);
        if (state.searchResult.isEmpty) {
          return Center(
            child: Text('No se encontraron resultados para "$query"'),
          );
        }
        return ListView.builder(
          itemCount: state.searchResult.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final product = state.searchResult[index];
            return SingleProduct(product: product);
          },
        );
      },
    );
  }


  //results of the search
  @override
  Widget buildResults(BuildContext context) {
    return Consumer<ProductViewModel>(builder: (context, state, child) {
      if (state.searchResult.isEmpty) {
        return Center(
          child: Text('No se encontraron resultados para "$query"'),
        );
      }
      return ListView.builder(
        itemCount: state.searchResult.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final product = state.searchResult[index];
          return SingleProduct(product: product);
        },
      );
    });
  }



}
