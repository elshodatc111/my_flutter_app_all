import 'package:flutter/material.dart';
import 'package:me_youtube_aplication/screen/sqllite/ui/widget/mind_item.dart';
import 'package:me_youtube_aplication/screen/sqllite/view_model/mind_view_model.dart';
import 'package:provider/provider.dart';

class AllMindsPage extends StatelessWidget {
  const AllMindsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All read minds"),
        backgroundColor: Colors.orange,
      ),
      body: Consumer<MindViewModel>(
        builder: (context,value, child){
          if(value.minds==null){
            context.read<MindViewModel>().readMends();
          }else if(value.isLoading){
            return const Center(child: CircularProgressIndicator(),);
          }else{
            return ListView.builder(
                itemCount: value.minds!.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  var mind = value.minds![index];
                  return MindItem(mind: mind);
                },
            );
          }
          return Container();
        },
      ),
    );
  }
}
