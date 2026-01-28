// import 'package:qr_pay_app/src/core/dependencies/injection_container.dart';
// import 'package:qr_pay_app/src/core/logic/search_word_storage.dart';
// import 'package:flutter/material.dart';

// class SearchVM extends ChangeNotifier {
//   List<String> savedWord = [];

//   void returnWord() async {
//     savedWord = sl<IWordStorage>().getWords() ?? [];
//   }

//   void addWord(String textSearch) async {
//     savedWord.add(textSearch);
//     sl<IWordStorage>().saveWords(savedWord);
//     notifyListeners();
//   }

//   void deleteByIndex(int index) {
//     savedWord.removeAt(index);
//     sl<IWordStorage>().saveWords(savedWord);
//     notifyListeners();
//   }

//   void clearAll() {
//     savedWord = [];
//     sl<IWordStorage>().deleteWords();
//   }
// }
