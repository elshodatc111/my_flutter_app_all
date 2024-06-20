import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me_youtube_aplication/screen/provider_two/ui/product/widget/product_item.dart';
import 'package:me_youtube_aplication/screen/provider_two/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    var myProvider = context.read<ProductViewModel>();
    return Consumer<ProductViewModel>(
        builder: (context, myProvider, child) {
          if (myProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (myProvider.products.isNotEmpty) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: myProvider.products.length,
              itemBuilder: (context, index) => ProductItem(product: myProvider.products[index]),
            );
          }else {
            return const Text("Data yoq");
          }
        },
    );
  }

}

