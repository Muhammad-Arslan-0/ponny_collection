import 'package:flutter/material.dart';

import '../../models/qa_model.dart';

class QAView extends StatelessWidget {
  final List<QAModel> questions;
  const QAView({super.key, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: ListView.builder(
            itemCount: questions.length,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              QAModel myQuestion = questions[index];
              return Column(
                children: [
                  if (index != 0) Divider(thickness: 2),
                  ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                        AssetImage(myQuestion.image),
                      ),
                      title: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(myQuestion.name,
                              style: TextStyle(fontSize: 20)),
                          Text(myQuestion.time)
                        ],
                      ),
                      subtitle: Text(
                        myQuestion.question,
                        style: TextStyle(fontSize: 16),
                      )),

                ],
              );
            }),
      ),
    );
  }
}
