import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class FbText extends StatefulWidget {
  String text;
  Color? color;
  Color? backgroundColor;
  double? fontSize;
  TextAlign? textAlign;
  TextDirection? textDirection;
  int? maxLines;

  FbText({
    this.text = "Sample Text",
    this.fontSize = 15.0,
    this.color = Colors.black,
    this.backgroundColor = Colors.white,
    this.textAlign,
    this.textDirection,
    this.maxLines,
  });

  @override
  _FbTextState createState() => _FbTextState();
}

class _FbTextState extends State<FbText> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showMyDialog();
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.color,
            backgroundColor: widget.backgroundColor,
            fontSize: widget.fontSize,
          ),
          textAlign: widget.textAlign,
          textDirection: widget.textDirection,
          maxLines: widget.maxLines,
        ),
      ),
    );
  }

  Future<void> showMyDialog() async {
    TextEditingController textController = new TextEditingController();
    TextEditingController fontSizeController = new TextEditingController();
    textController.text = widget.text;
    fontSizeController.text = widget.fontSize.toString();
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(0, 24.0, 0, 24.0),
          title: Text('Text Property Window'),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text("Text"),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: textController,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text("Font Size"),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: fontSizeController,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text("Font Color"),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextButton(
                          child: Text(
                            "Pick Font Color",
                            style: TextStyle(
                              color: widget.color,
                            ),
                          ),
                          onPressed: () {
                            pickColor(context, "Pick Font Color", 1);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text("background Color"),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextButton(
                          child: Text(
                            "Pick Background Color",
                          ),
                          onPressed: () {
                            pickColor(context, "Pick Background Color", 2);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ADD', style: TextStyle(fontSize: 15.0)),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  widget.text = textController.text;
                  widget.fontSize = double.parse(fontSizeController.text);
                });
              },
            ),
          ],
        );
      },
    );
  }

  void pickColor(BuildContext context, String title, int key) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Column(
            children: [
              buildPicker(key),
              TextButton(
                child: const Text('SELECT', style: TextStyle(fontSize: 20.0)),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      );

  Widget buildPicker(int key) {
    if (key == 1) {
      return ColorPicker(
          pickerColor: widget.color!,
          onColorChanged: (color) => setState(() => widget.color = color));
    } else {
      return ColorPicker(
          pickerColor: widget.backgroundColor!,
          onColorChanged: (color) =>
              setState(() => widget.backgroundColor = color));
    }
  }
}
