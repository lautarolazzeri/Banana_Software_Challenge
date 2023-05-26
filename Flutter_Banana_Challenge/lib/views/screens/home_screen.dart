import 'package:app/constants/constants.dart';
import 'package:app/service/login_service.dart';
import 'package:app/viewModels/products_viewmodel.dart';
import 'package:app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                LoginService().logout();
              },
              icon: const Icon(
                Icons.logout_outlined,
                color: white,
              ))
        ],
        title: const Text(
          'Flutter Challenge 2023',
          style: TextStyle(color: white),
        ),
        backgroundColor: appColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SearchInput(),
            const SizedBox(height: 16),
            FutureBuilder(
              future: ProductViewModel().getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Consumer<ProductViewModel>(
                    builder: (context, state, child) {
                      if (state.loading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.allProducts.length,
                        itemBuilder: (context, index) {
                          return SingleProduct(
                            product: state.allProducts[index],
                          );
                        },
                      );
                    },
                  );
                } else {
                  return const Text('asdasd');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
