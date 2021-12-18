import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class FbRadioButton extends StatefulWidget {
  List<RadioEntity> items = <RadioEntity>[];
  List<String> nameList = <String>[];
  String itemString = " Sample 1, Sample 2, Sample 3, Sample 4";
  int defaultSelect;
  double fontSize;
  Color fontColor;
  Color selectedFontColor;

  FbRadioButton({
    this.defaultSelect = 0,
    this.fontSize = 16.0,
    this.fontColor = Colors.black87,
    this.selectedFontColor = Colors.blueAccent,
  });

  @override
  _FbRadioButtonState createState() => _FbRadioButtonState();
}

class _FbRadioButtonState extends State<FbRadioButton> {
  late RadioEntity defaultItem;

  @override
  void initState() {
    widget.nameList = widget.itemString.split(',');
    widget.items.clear();
    for (int i = 0; i < widget.nameList.length; i++) {
      widget.items.add(RadioEntity(id: i, name: widget.nameList[i]));
    }
    defaultItem = widget.items[widget.defaultSelect];
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
              .map(
                (e) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 13.0,
                        ),
                        Container(
                          height: 16,
                          width: 16,
                          child: Transform.scale(
                            scale: 0.9,
                            child: Radio<RadioEntity>(
                              value: e,
                              groupValue: defaultItem,
                              onChanged: (val) {
                                setState(() {
                                  defaultItem = val!;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          e.name,
                          style: TextStyle(
                            fontSize: widget.fontSize,
                            color: defaultItem.name == e.name
                                ? widget.selectedFontColor
                                : widget.fontColor,
                            fontWeight: defaultItem.name == e.name
                                ? FontWeight.w600
                                : FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Future<void> showMyDialog() async {
    TextEditingController items = new TextEditingController();
    TextEditingController fontSize = new TextEditingController();
    TextEditingController selectedElement = new TextEditingController();
    items.text = widget.itemString;
    selectedElement.text = widget.defaultSelect.toString();
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
                        child: Text("Selected Element"),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: selectedElement,
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
                        child: Text("Selected Font Color"),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextButton(
                          child: Text(
                            "Pick Selected Font Color",
                            style: TextStyle(
                              color: widget.selectedFontColor,
                            ),
                          ),
                          onPressed: () {
                            pickColor(context, "Pick Selected Font Color", 2);
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
                          .add(RadioEntity(id: i, name: widget.nameList[i]));
                    }
                  } else {
                    widget.nameList = widget.itemString.split(',');
                    widget.items.clear();
                    for (int i = 0; i < widget.nameList.length; i++) {
                      widget.items
                          .add(RadioEntity(id: i, name: widget.nameList[i]));
                    }
                  }
                  widget.fontSize = double.parse(fontSize.text);
                  widget.defaultSelect = int.parse(selectedElement.text);
                  if (widget.defaultSelect < widget.items.length) {
                    defaultItem = widget.items[widget.defaultSelect];
                  } else {
                    widget.defaultSelect = 0;
                    defaultItem = widget.items[widget.defaultSelect];
                  }
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
          pickerColor: widget.fontColor,
          onColorChanged: (color) => setState(() => widget.fontColor = color));
    } else {
      return ColorPicker(
          pickerColor: widget.selectedFontColor,
          onColorChanged: (color) =>
              setState(() => widget.selectedFontColor = color));
    }
  }
}

class RadioEntity {
  int id;
  String name;

  RadioEntity({
    required this.id,
    required this.name,
  });
}
