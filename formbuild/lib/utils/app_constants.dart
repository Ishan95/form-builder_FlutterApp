import 'package:flutter/cupertino.dart';

class AppConstants {
  static List<FieldTypes> fieldList = [
    FieldTypes(type: "Text", key: 1),
    FieldTypes(type: "Text Field", key: 2),
    FieldTypes(type: "Media", key: 3),
    FieldTypes(type: "Rich Text", key: 4),
    FieldTypes(type: "Drop Down", key: 5),
    FieldTypes(type: "Radio Button", key: 6),
    FieldTypes(type: "Checkbox", key: 7),
    FieldTypes(type: "Number", key: 8),
    FieldTypes(type: "Date/Time", key: 9),
    FieldTypes(type: "File Upload", key: 10),
    FieldTypes(type: "Signature", key: 11),
    FieldTypes(type: "Calculated Value", key: 12),
    FieldTypes(type: "Tables", key: 13),
    FieldTypes(type: "Information", key: 14),
    FieldTypes(type: "Lookup", key: 15),
    FieldTypes(type: "Section", key: 16),
  ];

  static int elementID = 1;
  static List<ElementTypes> elementsList = [];
}

class FieldTypes {
  final String type;
  final int key;

  FieldTypes({
    required this.type,
    required this.key,
  });
}

class ElementTypes {
  final String elementName;
  final Widget element;
  final String elementId;

  ElementTypes({
    required this.elementName,
    required this.element,
    required this.elementId,
  });
}
