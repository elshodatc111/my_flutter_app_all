import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me_youtube_aplication/screen/sqllite/data/model/mind_model.dart';
import 'package:me_youtube_aplication/screen/sqllite/view_model/mind_view_model.dart';
import 'package:provider/provider.dart';

class MindItem extends StatelessWidget {
  MindModel mind;

  TextEditingController mindControl = TextEditingController();
  TextEditingController author = TextEditingController();


  MindItem({required this.mind, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mindControl.text = mind.mind;
    author.text=mind.auther;
    return ListTile(
      onLongPress: (){
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            alignment: Alignment.center,
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("Bekor qilish")),
              TextButton(onPressed: (){
                context.read<MindViewModel>().deleteMind(mind.mind);
                Navigator.pop(context);
              }, child: Text("Ha")),
            ],
            title: Text("Siz Mendni o'chirmoqchimisiz?"),
          ),
        );

      },
      title: Text(mind.mind),
      subtitle: Text(mind.auther),
      trailing: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              alignment: Alignment.center,
              actions: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: const Text("Bekor qilish")),
                TextButton(onPressed: (){
                  context.read<MindViewModel>().updateMend(MindModel(auther: author.text, mind: mindControl.text), mind.mind);
                  Navigator.pop(context);
                }, child: const Text("Yangilash")),
              ],
              content: SizedBox(
                height: 130,
                child: Column(
                  children: [
                    TextField(
                      controller: mindControl,
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
              title: const Text("Mindni yangilash"),
            ),
          );
        },
        icon: const Icon(Icons.edit),
      ),
    );
  }
}
