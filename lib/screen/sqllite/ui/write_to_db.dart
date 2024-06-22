import 'package:flutter/material.dart';
import 'package:me_youtube_aplication/screen/sqllite/data/model/mind_model.dart';
import 'package:me_youtube_aplication/screen/sqllite/ui/all_minds_page.dart';
import 'package:me_youtube_aplication/screen/sqllite/view_model/mind_view_model.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
class WriteToDb extends StatelessWidget {
  WriteToDb({Key? key}) : super(key: key);
  TextEditingController mind = TextEditingController();
  TextEditingController author = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Write to DB"),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            onPressed: () {
              context.read<MindViewModel>().readMends();
              Get.to(()=>const AllMindsPage());
            },
            icon: const Icon(Icons.read_more),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: mind,
              decoration: const InputDecoration(
                label: Text("Quort"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: author,
              decoration: const InputDecoration(
                label: Text("Auther"),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context
              .read<MindViewModel>()
              .addMind(MindModel(auther: author.text, mind: mind.text));
        },
        child: Icon(Icons.add), //23;35
        backgroundColor: Colors.orange,
      ),
    );
  }
}
