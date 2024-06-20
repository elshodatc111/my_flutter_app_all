import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:me_youtube_aplication/screen/provider_two/servise/api_serves/api_serves.dart';
import 'package:me_youtube_aplication/screen/provider_two/servise/storage/storage_service.dart';
import 'package:me_youtube_aplication/screen/provider_two/ui/product/widget/product_item.dart';

class ProductShowViewModel extends ChangeNotifier {
  ProductItem? products;
  bool isLoading = false;

  void getSingleProduct() async {
    changeLoadingState();
    products = await ApiServes().getSingleProduct();
    changeLoadingState();
  }
  void addStorage(int id, String title, String image, String description, num price) {
    List heards = StorageService.get('heards') ?? [];
    //heards.clear();
    heards.add({
      'id': id,
      'title': title,
      'image': image,
      'description': description,
      'price': price,
    });
    print(heards);
    StorageService.put('heards', heards);
    changeLoadingState();
  }

  void changeLoadingState() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
