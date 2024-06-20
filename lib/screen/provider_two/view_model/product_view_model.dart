import 'package:flutter/material.dart';
import 'package:me_youtube_aplication/screen/provider_two/servise/api_serves/api_serves.dart';

class ProductViewModel extends ChangeNotifier {
  bool isLoading = false;

  List products = [];

  void getAppProduct() async {
    changeLoadingState();
    products = await ApiServes().getAppProduct();
    changeLoadingState();
  }

  void changeLoadingState(){
    isLoading = !isLoading;
    notifyListeners();
  }
}