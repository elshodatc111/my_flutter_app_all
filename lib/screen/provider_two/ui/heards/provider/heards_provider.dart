import 'package:flutter/cupertino.dart';
import 'package:me_youtube_aplication/screen/provider_two/servise/storage/storage_service.dart';

class HeardsProvider extends ChangeNotifier{
  List heards = [];
  HeardsProvider(){
    getAllHrards();
  }
  void getAllHrards(){
    heards = StorageService.get('heards')??[];
    notifyListeners();
  }
}