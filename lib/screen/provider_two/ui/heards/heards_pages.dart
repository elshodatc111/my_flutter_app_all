import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:me_youtube_aplication/screen/provider_two/ui/heards/provider/heards_provider.dart';
import 'package:provider/provider.dart';

class HeardsPages extends StatefulWidget {
  const HeardsPages({super.key});

  @override
  State<HeardsPages> createState() => _HeardsPagesState();
}

class _HeardsPagesState extends State<HeardsPages> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HeardsProvider(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Saqlanganlar',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.orange,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<HeardsProvider>().getAllHrards();
              },
              child: ListView.builder(
                itemCount: context.watch<HeardsProvider>().heards.length,
                itemBuilder: (context, index) {
                  var heard = context.watch<HeardsProvider>().heards[index];
                  return HeadsLests(
                      title: "${heard['title']}", image: "${heard['image']}");
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class HeadsLests extends StatelessWidget {
  final String title;
  final String image;

  const HeadsLests({
    required this.title,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white30,
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.all(15),
        child: ListTile(
          title: Column(
            children: [
              Image.network(
                image,
                height: Get.width * 0.5,
              ),
              Text(title),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.remove_red_eye),
                    color: Colors.blue,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete_rounded),
                    color: Colors.redAccent,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
