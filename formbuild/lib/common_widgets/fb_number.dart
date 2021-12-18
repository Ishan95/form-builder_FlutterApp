import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FbNumber extends StatefulWidget {
  int value;

  FbNumber({
    this.value = 0,
  });

  @override
  _FbNumberState createState() => _FbNumberState();
}

class _FbNumberState extends State<FbNumber> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: showMyDialog,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.blueAccent),
        ),
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: decrease,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.blueAccent),
                ),
                padding: EdgeInsets.all(4.0),
                width: 50,
                height: 50,
                child: Text(
                  "-",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "${widget.value}",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: increase,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.blueAccent),
                ),
                padding: EdgeInsets.all(4.0),
                width: 50,
                height: 50,
                child: Text(
                  "+",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void increase() {
    setState(() {
      widget.value = widget.value + 1;
    });
  }

  void decrease() {
    setState(() {
      widget.value = widget.value - 1;
    });
  }

  Future<void> showMyDialog() async {
    TextEditingController numberValue = new TextEditingController();
    numberValue.text = "${widget.value}";
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(0, 24.0, 0, 24.0),
          title: Text('Number Property Window'),
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
                        child: Text("Initial Value"),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          controller: numberValue,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25.0,
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
                  widget.value = int.parse(numberValue.text);
                });
              },
            ),
          ],
        );
      },
    );
  }
}
