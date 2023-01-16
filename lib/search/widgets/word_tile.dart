import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_that_mean/app/models/full_word.dart';
import 'package:whats_that_mean/search/widgets/individual_word_tiles.dart';

import '../../saved/cubit/saved_cubit.dart';

class WordTile extends StatelessWidget {
  const WordTile({Key? key, required this.fullWord}) : super(key: key);
  final FullWord? fullWord;

  @override
  Widget build(BuildContext context) {
    if (fullWord == null) {
      return const SizedBox();
    } else {
      return BlocBuilder<SavedWordCubit, SavedWordState>(
          builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Theme.of(context).canvasColor,
            child: Column(
              children: [
                Visibility(
                  replacement: IconButton(
                      onPressed: () {
                        context.read<SavedWordCubit>().removeWord(fullWord);
                      },
                      icon: const Icon(
                        Icons.delete
                      )),
                  visible: !(state.fullWords ?? [])!.contains(fullWord),
                  child: IconButton(
                      onPressed: () {
                        context.read<SavedWordCubit>().saveWord(fullWord);
                      },
                      icon: const Icon(
                        Icons.save,
                      )),
                ),
                Text(fullWord!.word!),
                //  Text(fullWord!.singlePronunciation == null ? fullWord!.pronunciation!.all! : fullWord!.singlePronunciation!),
                Column(
                  children: words() ?? [],
                ),
              ],
            ),
          ),
        );
      });
    }
  }

  List<Widget>? words() {
    if (fullWord == null) {
      return null;
    }
    if (fullWord?.words == null) {
      return null;
    }
    return fullWord?.words?.map((e) => IndividualWordTile(word: e)).toList();
  }
}
