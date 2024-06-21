import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me_youtube_aplication/screen/counter/provider_counter.dart';

import 'package:me_youtube_aplication/screen/provider_two/ui/heards/heards_pages.dart';
import 'package:me_youtube_aplication/screen/provider_two/ui/product/widget/product_item.dart';
import 'package:me_youtube_aplication/screen/provider_two/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    var myProvider = context.read<ProductViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("All Products"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ProductViewModel>().getAppProduct();
            },
            icon: const Icon(Icons.refresh),
            color: Colors.white,
          ),
        ],
      ),
      body: Consumer<ProductViewModel>(
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
              itemBuilder: (context, index) =>
                  ProductItem(product: myProvider.products[index]),
            );
          } else {
            return const Center(
              child: Text("Sahifani yangilang"),
            );
          }
        },
      ),
      drawer: Drawer(
        backgroundColor: Colors.orange,
        width: Get.width * 0.75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(() => const ProviderCounter());
              },
              child: const Text("Counter"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const HeardsPages());
              },
              child: const Text("Saqlanganlar"),
            ),
          ],
        ),
      ),
    );
  }
}
