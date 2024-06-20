import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/currency.dart';

class PageCurrency extends StatefulWidget {
  const PageCurrency({super.key});

  @override
  State<PageCurrency> createState() => _PageCurrencyState();
}

class _PageCurrencyState extends State<PageCurrency> {
  Future<List> getDataFromApi() async {
    var response = await Dio().get('https://nbu.uz/en/exchange-rates/json/');
    List currencies = response.data
        .map((current_currency) => Currency.fromJson(current_currency))
        .toList();
    return currencies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
        future: getDataFromApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            List data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.05, vertical: 4),
                width: Get.width * 0.9,
                padding: EdgeInsets.all(5),
                color: Colors.orange,
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data[index].title),
                    Text(data[index].cb_price),
                    Text(data[index].data),
                    Text(data[index].code),
                  ],
                ),
              ),
            );
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Text("sss");
        },
      )),
    );
  }
}
