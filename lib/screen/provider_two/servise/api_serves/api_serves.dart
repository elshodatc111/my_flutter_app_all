import 'package:dio/dio.dart';
import 'package:me_youtube_aplication/screen/provider_two/data/model/product_model/product_model.dart';
class ApiServes{
  Future getAppProduct() async{
    Dio dio = Dio();
    print("Response boshlandi");
    Response response = await dio.get("https://fakestoreapi.com/products");
    if(response.statusCode==200){
      List products = response.data.map((e)=>ProductModel.fromJson(e)).toList();
      return products;
    }

  }
}