import 'package:get/get.dart';
import 'package:me_youtube_aplication/screen/provider_two/data/model/product_model/product_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  ProductModel product;

  ProductItem({required this.product, Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.8,
      margin: EdgeInsets.symmetric(
          horizontal: Get.width * 0.05, vertical: Get.width * 0.03),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
      child: Column(
        children: [
          Image.network(
            product.image,
            width: double.infinity,
            height: 300,
          ),
          Text(
            product.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
