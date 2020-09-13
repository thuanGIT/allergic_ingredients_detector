import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'ResultPage.dart';

class CameraPage extends StatefulWidget {
  final String category;
  const CameraPage({Key key, this.category}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new CameraPageState();
  }
}

class CameraPageState extends State<CameraPage> {
  File pickedImage;
  bool isImageLoaded;
  Set<String> result;

  @override
  void initState() {
    super.initState();
    setState(() {
      isImageLoaded = false;
      result = new Set<String>();
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
    print('click');
    final FirebaseVisionImage ourImage =
        FirebaseVisionImage.fromFile(pickedImage);
    final TextRecognizer detector = FirebaseVision.instance.textRecognizer();
    VisionText readText = await detector.processImage(ourImage);

    // Iterate over the entire block of words
    for (TextBlock block in readText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {
          print(word.text.toLowerCase());
          result.add(word.text.toLowerCase());
        }
      }
    }

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ResultPage(
                result: result,
                category: widget.category,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
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
            : Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('asset/images/image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
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
          child: Text('Check'),
          onPressed: readText,
        ),
      ],
    );
  }
}
