import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meditationapp/presentasion/topic/models/list_topic.model.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({Key? key}) : super(key: key);

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: StaggeredGrid.count(

            crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10, children:  [
           for(int i = 0; i < listTopic.length; i++)
             StaggeredGridTile.count(
               crossAxisCellCount: 2,
               mainAxisCellCount: listTopic[i].mainAxis,
               child: Container(

                 color: listTopic[i].colorCard,
                 child: Column(children: [
                   Image.asset(listTopic[i].assetImage),
                   SizedBox(height: 20,),
                   InkWell(
                     onTap: (){
                       setState(() {})
                     },
                     child: Text(listTopic[i].nameTopic, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                   ),
                   Text(listTopic[i].nameTopic)
                 ],),
               ),
             ),



          ],)),
    );
  }
}
