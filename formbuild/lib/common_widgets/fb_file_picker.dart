import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class FbFilePicker extends StatefulWidget {
  final Color color;
  final double radius;
  final double strokeWidth;
  final double padding;
  final double iconSize;
  final double height;

  FbFilePicker({
    this.color = Colors.blue,
    this.strokeWidth = 1,
    this.radius = 4,
    this.padding = 6,
    this.iconSize = 48,
    this.height = 175,
  });

  @override
  _FbFilePickerState createState() => _FbFilePickerState();
}

class _FbFilePickerState extends State<FbFilePicker> {
  bool value = false;
  String fileName = "";
  FilePickerResult? result;
  PlatformFile? file;

  @override
  Widget build(BuildContext context) {
    return value == false
        ? GestureDetector(
            onTap: pickFile,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.blueAccent),
              ),
              padding: EdgeInsets.all(widget.padding),
              width: double.infinity,
              height: widget.height,
              child: Icon(
                CupertinoIcons.add_circled_solid,
                color: Colors.blueAccent,
                size: widget.iconSize,
              ),
            ),
          )
        : Container(
            width: double.infinity,
            height: 90,
            padding: EdgeInsets.all(10.0),
            child: Container(
              height: widget.height,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsets.all(widget.padding),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(
                          image: AssetImage('images/file.png'),
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: GestureDetector(
                            onTap: openFile,
                            child: Text(
                              fileName,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              value = false;
                              fileName = "";
                              result = null;
                            });
                          },
                          icon: Icon(
                            Icons.clear,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  void pickFile() async {
    result = await FilePicker.platform.pickFiles();
    if (result == null) {
      return;
    } else {
      setState(() {
        value = true;
        file = result!.files.first;
        fileName = file!.name;
      });
    }
  }

  void openFile() {
    OpenFile.open(file!.path);
  }
}
