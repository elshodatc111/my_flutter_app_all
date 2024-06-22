import 'package:flutter/cupertino.dart';
import 'package:me_youtube_aplication/screen/sqllite/data/model/mind_model.dart';
import 'package:me_youtube_aplication/screen/sqllite/data/reposetory/mind_repository.dart';

class MindViewModel extends ChangeNotifier{
  MindRepository? mindRepository;
  MindViewModel({required this.mindRepository});

  List<MindModel>? minds;
  bool isLoading = false;

  void addMind(MindModel mind) async{
    mindRepository!.addMind(mind);
  }

  void readMends() async{
    loadingChange();
    minds = await mindRepository!.readMind();
    loadingChange();
  }

  void updateMend(MindModel mindModel,String mind) async{
    mindRepository!.updateMind(mindModel, mind);
    readMends();
  }

  void deleteMind(String mind) async{
    mindRepository!.deleteMind(mind);
    readMends();
  }

  void loadingChange(){
    isLoading=!isLoading;
    notifyListeners();
  }
}