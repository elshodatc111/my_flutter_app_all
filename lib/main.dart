import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me_youtube_aplication/screen/counter/counter_view_model.dart';
import 'package:me_youtube_aplication/screen/provider_two/view_model/product_view_model.dart';
import 'package:me_youtube_aplication/screen/sqllite/data/reposetory/mind_repository.dart';
import 'package:me_youtube_aplication/screen/sqllite/service/local_db_service.dart';
import 'package:me_youtube_aplication/screen/sqllite/ui/write_to_db.dart';
import 'package:me_youtube_aplication/screen/sqllite/view_model/mind_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MindViewModel(
            mindRepository: MindRepository(
              db: LocalDatabase(),
            ),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: WriteToDb(),
    );
  }
}
