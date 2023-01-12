import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whats_that_mean/app/models/full_word.dart';
import 'package:whats_that_mean/search/widgets/individual_word_tiles.dart';

class WordTile extends StatelessWidget {
  const WordTile({Key? key, required this.fullWord}) : super(key: key);
  final FullWord? fullWord;
  @override
  Widget build(BuildContext context) {
    if (fullWord == null) {
      return const SizedBox();
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Theme.of(context).canvasColor,
        child: Column(
          children: [
            Text(fullWord!.word!),
            Text(fullWord!.singlePronunciation == null ? fullWord!.pronunciation!.all! : fullWord!.singlePronunciation!),
            Column(
              children: words() ?? [],
            ),

          ],
        ),
    ),
      );
    }
  }
  List<Widget>? words(){
    if(fullWord == null) {
      return null;
    }
    if(fullWord?.words == null) {
      return null;
    }
    return fullWord?.words?.map((e) => IndividualWordTile(word: e)).toList();
  }

}

