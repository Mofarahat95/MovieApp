import 'package:flutter/material.dart';

import '../network/firestore.dart';




class SaveMovieProvider extends ChangeNotifier{

  bookmarkButtonPressed(Details model) {
    model.isFavorite = !model.isFavorite;
    (model.isFavorite)
        ? FireStoreUtils.addDataToFireStore(model)
        : FireStoreUtils.deleteDataFromFireStore(model);
    notifyListeners();
  }
}

