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
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 74,
              ),
              const Text("What Bring You",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const Text(
                "to Silent Moon?",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "choose a topic to focuse on",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              StaggeredGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 30,
                crossAxisSpacing: 10,
                children: [
                  for (int i = 0; i < listTopic.length; i++)
                    StaggeredGridTile.fit(
                      crossAxisCellCount: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: listTopic[i].colorCard,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              listTopic[i].assetImage,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, bottom: 16),
                              child: Text(
                                listTopic[i].nameTopic,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            // Text(listTopic[i].nameTopic)
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
