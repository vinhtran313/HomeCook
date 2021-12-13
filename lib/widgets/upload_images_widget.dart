import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class UploadImage extends StatefulWidget {
  Function(List<String>) callback;
  bool loading = false;

  UploadImage({Key? key, required this.callback}) : super(key: key);

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  @override
  Widget build(BuildContext context) {
    Future<String> uploadPicture(File image) async {
      setState(() {
        widget.loading = true;
      });
      String fileName = basename(image.path);
      FirebaseStorage storage = FirebaseStorage.instance;
      String url = '';
      Reference ref = storage.ref().child(fileName + DateTime.now().toString());
      UploadTask uploadTask = ref.putFile(image);
      await uploadTask.whenComplete(() async {
        url = await ref.getDownloadURL();
      }).catchError((onError) {
        print(onError);
      });
      return url;
    }

    Future uploadPictures(BuildContext context, List<File> images) async {
      List<String> urls = [];
      urls = await Future.wait(images.map((image) => uploadPicture(image)));
      return urls;
    }

    Future chooseFile() async {
      final ImagePicker _picker = ImagePicker();
      List<XFile>? images = await _picker.pickMultiImage(
        maxWidth: 1024,
        imageQuality: 80,
      );
      List<File> files = [];
      for (int i = 0; i < images!.length; i++) {
        XFile image = images[i];
        File file = File(image.path);
        files.add(file);
      }
      List<String> urls = await uploadPictures(context, files);
      setState(() {
        widget.loading = false;
      });
      widget.callback(urls);
    }

    return widget.loading == false
        ? InkWell(
            onTap: chooseFile,
            child: LayoutBuilder(builder: (context, constraints) {
              return Container(
                width: constraints.biggest.width * 0.5,
                height: constraints.biggest.width * 0.5,
                child: Column(children: [
                  Icon(
                    Icons.cloud_upload_outlined,
                    size: constraints.biggest.width * 0.4,
                    color: Colors.black26,
                  ),
                  Expanded(
                      child: Text(
                    'Upload Images',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ))
                ]),
              );
            }),
          )
        : SpinKitRotatingCircle(
            color: Colors.grey,
            size: 50.0,
          );
  }
}
