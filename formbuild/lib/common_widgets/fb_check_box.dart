import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class FbCheckBox extends StatefulWidget {
  List<CheckBoxEntity> items = <CheckBoxEntity>[];
  List<String> nameList = <String>[];
  String itemString = " Sample 1, Sample 2, Sample 3, Sample 4";
  double fontSize;
  Color fontColor;

  FbCheckBox({
    this.fontSize = 16.0,
    this.fontColor = Colors.black87,
  });

  @override
  _FbCheckBoxState createState() => _FbCheckBoxState();
}

class _FbCheckBoxState extends State<FbCheckBox> {
  @override
  void initState() {
    widget.nameList = widget.itemString.split(',');
    widget.items.clear();
    for (int i = 0; i < widget.nameList.length; i++) {
      widget.items.add(CheckBoxEntity(id: i, name: widget.nameList[i]));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showMyDialog();
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.blueAccent),
        ),
        child: Column(
          children: widget.items
              .map((e) => Column(
                    children: [
                      SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 10.0,
                          ),
                          SizedBox(
                            height: 13,
                            width: 13,
                            child: Checkbox(
                              activeColor: Colors.blueAccent,
                              value: e.value,
                              onChanged: (bool? val) {
                                setState(() {
                                  e.value = val!;
                                });
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              e.name,
                              style: TextStyle(
                                fontSize: widget.fontSize,
                                color: widget.fontColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }

  Future<void> showMyDialog() async {
    TextEditingController items = new TextEditingController();
    TextEditingController fontSize = new TextEditingController();
    items.text = widget.itemString;
    fontSize.text = widget.fontSize.toString();
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(0, 24.0, 0, 24.0),
          title: Text('Radio Button Property Window'),
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
                        child: Text("Items List"),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: items,
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
                          controller: fontSize,
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
                              color: widget.fontColor,
                            ),
                          ),
                          onPressed: () {
                            pickColor(context, "Pick Font Color");
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
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
                  widget.itemString = items.text;
                  if (widget.itemString == null || widget.itemString == "") {
                    widget.itemString =
                        " Sample 1, Sample 2, Sample 3, Sample 4";
                    widget.nameList = widget.itemString.split(',');
                    widget.items.clear();
                    for (int i = 0; i < widget.nameList.length; i++) {
                      widget.items
                          .add(CheckBoxEntity(id: i, name: widget.nameList[i]));
                    }
                  } else {
                    widget.nameList = widget.itemString.split(',');
                    widget.items.clear();
                    for (int i = 0; i < widget.nameList.length; i++) {
                      widget.items
                          .add(CheckBoxEntity(id: i, name: widget.nameList[i]));
                    }
                  }
                  widget.fontSize = double.parse(fontSize.text);
                });
              },
            ),
          ],
        );
      },
    );
  }

  void pickColor(BuildContext context, String title) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title),
          content: Column(
            children: [
              buildPicker(),
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

  Widget buildPicker() {
    return ColorPicker(
        pickerColor: widget.fontColor,
        onColorChanged: (color) => setState(() => widget.fontColor = color));
  }
}

class CheckBoxEntity {
  int id;
  String name;
  bool value;

  CheckBoxEntity({
    required this.id,
    required this.name,
    this.value = false,
  });
}
