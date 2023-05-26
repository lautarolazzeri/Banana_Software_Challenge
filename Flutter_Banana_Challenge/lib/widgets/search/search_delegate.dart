import 'package:app/viewModels/products_viewmodel.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//search delegate
class SearchDelegateProducts extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar Productos';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer<ProductViewModel>(builder: (context, state, child) {
      if (state.searchResult.isEmpty) {
        return const Center(
          child: Text('No se encontraron resultados'),
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

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Icon(Icons.search, size: 100, color: Colors.grey),
      );
    }

    final productsProvider = context.read<ProductViewModel>();

    return Consumer<ProductViewModel>(
      builder: (context, state, child) {
        productsProvider.searchByProduct(query);
        if (state.searchResult.isEmpty) {
          return const Center(
            child: Text('No se encontraron resultados'),
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
}
