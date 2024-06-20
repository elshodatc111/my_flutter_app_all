import 'package:flutter/material.dart';
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
            title: const Text('Todo App'),
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
                  return HeadsLests(title: "${heard['title']}", image: "${heard['image']}");
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
      child: ListTile(
        title: Image.network(image),
        subtitle: Text(title),
      ),
    );
  }
}
