import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class FbSignaturePad extends StatefulWidget {
  const FbSignaturePad({Key? key}) : super(key: key);

  @override
  _FbSignaturePadState createState() => _FbSignaturePadState();
}

class _FbSignaturePadState extends State<FbSignaturePad> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.blueAccent),
      ),
      padding: EdgeInsets.all(12.0),
      width: double.infinity,
      height: 175.0,
      child: SfSignaturePad(
        backgroundColor: Colors.black12,
        strokeColor: Colors.blueAccent,
        maximumStrokeWidth: 6.0,
        minimumStrokeWidth: 4.0,
      ),
    );
  }
}
