import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imagepickerprovider extends ChangeNotifier {
  File? _selectImage;
  final ImagePicker _picker = ImagePicker();

  File? get selectImage => _selectImage;

  //function to pic image from gallary
  void clearImage() {
    _selectImage = null;
    notifyListeners();
  }

  Future<void> pickImage() async {
    _selectImage = null;
    try {
      final pickImage = await _picker.pickImage(source: ImageSource.gallery);
      print('pick image : ${pickImage.toString()}');
      if (pickImage != null) {
        _selectImage = File(pickImage.path);
        notifyListeners();
      }
    } catch (e) {
      print('image picker error : ${e.toString()}');
    }
  }
}
