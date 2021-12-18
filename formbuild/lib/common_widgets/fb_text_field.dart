import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class FbTextField extends StatefulWidget {
  TextInputType? keyboardType;
  TextCapitalization textCapitalization;
  Color? color;
  Color? backgroundColor;
  double? fontSize;
  String hintText;

  String textFieldName;
  Color? colorFieldName;
  double? fontSizeFieldName;

  FbTextField({
    this.hintText = "Hint Text Apply Here",
    this.textFieldName = "TextFiled Name",
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.color = Colors.black54,
    this.backgroundColor = Colors.white60,
    this.fontSize = 12.0,
    this.colorFieldName = Colors.black,
    this.fontSizeFieldName = 15.0,
  });

  @override
  _FbTextFieldState createState() => _FbTextFieldState();
}

class _FbTextFieldState extends State<FbTextField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showMyDialog();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.blueAccent),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.0,
            ),
            Text(
              widget.textFieldName,
              style: TextStyle(
                color: widget.colorFieldName,
                fontSize: widget.fontSizeFieldName,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: widget.hintText,
              ),
              style: TextStyle(
                color: widget.color,
                fontSize: widget.fontSize,
                backgroundColor: widget.backgroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showMyDialog() async {
    TextEditingController hintTextController = new TextEditingController();
    TextEditingController fieldNameController = new TextEditingController();
    TextEditingController fontSizeController = new TextEditingController();
    TextEditingController fontSizeFieldNameController =
        new TextEditingController();
    hintTextController.text = widget.hintText;
    fieldNameController.text = widget.textFieldName;
    fontSizeController.text = widget.fontSize.toString();
    fontSizeFieldNameController.text = widget.fontSizeFieldName.toString();
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(0, 24.0, 0, 24.0),
          title: Text('TextField Property Window'),
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
                        child: Text("Hint Text"),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: hintTextController,
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
                  SizedBox(
                    height: 8.0,
                  ),
                  Divider(),
                  SizedBox(
                    height: 3.0,
                  ),
                  Text("Text Filed Name Properties"),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text("Filed Name"),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: fieldNameController,
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
                          controller: fontSizeFieldNameController,
                        ),
                      ),
                    ],
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
                            pickColor(context, "Pick Font Color", 3);
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
                  widget.hintText = hintTextController.text;
                  widget.fontSize = double.parse(fontSizeController.text);
                  widget.fontSizeFieldName =
                      double.parse(fontSizeFieldNameController.text);
                  widget.textFieldName = fieldNameController.text;
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
    } else if (key == 3) {
      return ColorPicker(
          pickerColor: widget.colorFieldName!,
          onColorChanged: (color) =>
              setState(() => widget.colorFieldName = color));
    } else {
      return ColorPicker(
          pickerColor: widget.backgroundColor!,
          onColorChanged: (color) =>
              setState(() => widget.backgroundColor = color));
    }
  }
}
