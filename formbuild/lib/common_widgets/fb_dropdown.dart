import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class FbDropDown extends StatefulWidget {
  List<String> items = <String>[];
  String itemString = "Sample 1, Sample 2, Sample 3, Sample 4";
  int selectedItem;
  Color dropDownColor;
  double fontSize;
  Color textColor;

  FbDropDown({
    this.selectedItem = 0,
    this.dropDownColor = Colors.white,
    this.fontSize = 13.0,
    this.textColor = Colors.black87,
  });

  @override
  _FbDropDownState createState() => _FbDropDownState();
}

class _FbDropDownState extends State<FbDropDown> {
  @override
  void initState() {
    widget.items = widget.itemString.split(',');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showMyDialog();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.blueAccent),
        ),
        child: DropdownButtonFormField<String>(
          value: widget.items[widget.selectedItem],
          dropdownColor: widget.dropDownColor,
          items: widget.items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: widget.fontSize,
                  color: widget.textColor,
                ),
              ),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ),
    );
  }

  Future<void> showMyDialog() async {
    TextEditingController items = new TextEditingController();
    TextEditingController fontSize = new TextEditingController();
    TextEditingController selectedElement = new TextEditingController();
    items.text = widget.itemString;
    selectedElement.text = widget.selectedItem.toString();
    fontSize.text = widget.fontSize.toString();
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(0, 24.0, 0, 24.0),
          title: Text('DropDown Property Window'),
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
                              color: widget.textColor,
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
                        "Sample 1, Sample 2, Sample 3, Sample 4";
                    widget.items = widget.itemString.split(',');
                  } else {
                    widget.items = widget.itemString.split(',');
                  }
                  widget.fontSize = double.parse(fontSize.text);
                  widget.selectedItem = int.parse(selectedElement.text);
                  if (widget.selectedItem < widget.items.length) {
                    ///Ok
                  } else {
                    widget.selectedItem = 0;
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
          pickerColor: widget.textColor,
          onColorChanged: (color) => setState(() => widget.textColor = color));
    } else {
      return ColorPicker(
          pickerColor: widget.dropDownColor,
          onColorChanged: (color) =>
              setState(() => widget.dropDownColor = color));
    }
  }
}
