import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

class CameraPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CameraPageState();
  }
}

class CameraPageState extends State<CameraPage> {
  File pickedImage;
  bool isImageLoaded;

  @override
  void initState() {
    super.initState();
    setState(() {
      isImageLoaded = false;
    });
  }

  Future pickImage() async {
    final tempStore = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      pickedImage = File(tempStore.path);
      isImageLoaded = true;
    });
  }

  Future readText() async {
    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(pickedImage);
    TextRecognizer detector = FirebaseVision.instance.textRecognizer();
    VisionText readText = await detector.processImage(ourImage);

    // Iterate over the entire block of words
    for (TextBlock block in readText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {
          print(word.text);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          isImageLoaded
              ? Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(pickedImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              : Center(),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            child: Text('Pick an image'),
            onPressed: pickImage,
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            child: Text('Read text'),
            onPressed: readText,
          ),
        ],
      ),
    );
  }
}
