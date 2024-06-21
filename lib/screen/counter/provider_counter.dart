import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me_youtube_aplication/screen/counter/counter_view_model.dart';
import 'package:provider/provider.dart';

class ProviderCounter extends StatelessWidget {
  const ProviderCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Counter",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Counter Counts",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Text(
              "${context.watch<CounterViewModel>().count}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.orange,
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<CounterViewModel>().decrement();
                  },
                  icon: const Icon(Icons.exposure_minus_1),
                  color: Colors.red,
                ),
                IconButton(
                  onPressed: () {
                    context.read<CounterViewModel>().incremet();
                  },
                  icon: const Icon(Icons.exposure_plus_1_rounded),
                  color: Colors.blue,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
