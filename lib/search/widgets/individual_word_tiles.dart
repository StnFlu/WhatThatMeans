import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whats_that_mean/app/models/word.dart';

class IndividualWordTile extends StatelessWidget {
  const IndividualWordTile({Key? key, required this.word}) : super(key: key);
  final Word? word;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Theme.of(context).canvasColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(word?.partOfSpeech ?? "null"),
                  Text(word?.definition ?? "null"),
                  Visibility(
                    visible: word?.synonyms != null,
                    child: Row(
                      children:[
                        Text("Synonyms:"),
                        ...?words()
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }

  List<Widget>? words(){
    if(word == null) {
      return null;
    }
    if(word?.synonyms == null) {
      return null;
    }
    return word?.synonyms?.map((e) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(e),
    )).toList();
  }

}
