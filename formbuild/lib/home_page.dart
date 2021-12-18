import 'package:flutter/material.dart';
import 'package:formbuild/common_widgets/bottom_list_tile.dart';
import 'package:formbuild/common_widgets/fb_camera_image.dart';
import 'package:formbuild/common_widgets/fb_check_box.dart';
import 'package:formbuild/common_widgets/fb_date_picker.dart';
import 'package:formbuild/common_widgets/fb_dropdown.dart';
import 'package:formbuild/common_widgets/fb_file_picker.dart';
import 'package:formbuild/common_widgets/fb_number.dart';
import 'package:formbuild/common_widgets/fb_radio_button.dart';
import 'package:formbuild/common_widgets/fb_signature.dart';
import 'package:formbuild/common_widgets/fb_text.dart';
import 'package:formbuild/common_widgets/fb_text_field.dart';
import 'package:formbuild/utils/app_constants.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget showList() {
    return ListView.builder(
      itemCount: AppConstants.elementsList.length,
      itemBuilder: (BuildContext context, int item) {
        return rowItem(context, item);
      },
    );
  }

  Widget rowItem(context, item) {
    return Dismissible(
      key: Key(AppConstants.elementsList[item].elementId),
      onDismissed: (direction) {
        ElementTypes element = AppConstants.elementsList[item];
        showSnackBar(context, element, item);
        removeElement(item);
      },
      background: deleteItem(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppConstants.elementsList[item].element,
      ),
    );
  }

  Widget deleteItem() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  showSnackBar(BuildContext context, ElementTypes element, int item) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(element.elementName + ' deleted'),
      action: SnackBarAction(
        label: "Undo Delete",
        onPressed: () {
          undoDelete(item, element);
        },
      ),
    ));
  }

  undoDelete(item, element) {
    setState(() {
      AppConstants.elementsList.insert(item, element);
    });
  }

  removeElement(int item) {
    setState(() {
      AppConstants.elementsList.removeAt(item);
    });
  }

  addElements(int elementType) {
    switch (elementType) {
      case 1:
        setState(() {
          AppConstants.elementsList.add(ElementTypes(
              elementName: "Text",
              element: FbText(),
              elementId: "Text${AppConstants.elementID}"));
        });
        break;
      case 2:
        setState(() {
          AppConstants.elementsList.add(ElementTypes(
              elementName: "Text Field",
              element: FbTextField(),
              elementId: "TextField${AppConstants.elementID}"));
        });
        break;
      case 3:
        setState(() {
          AppConstants.elementsList.add(ElementTypes(
              elementName: "Media",
              element: FbCameraView(),
              elementId: "Media${AppConstants.elementID}"));
        });
        break;
      case 5:
        setState(() {
          AppConstants.elementsList.add(ElementTypes(
              elementName: "Dropdown",
              element: FbDropDown(),
              elementId: "Drop${AppConstants.elementID}"));
        });
        break;
      case 6:
        setState(() {
          AppConstants.elementsList.add(ElementTypes(
              elementName: "RadioButton",
              element: FbRadioButton(),
              elementId: "Radio${AppConstants.elementID}"));
        });
        break;
      case 7:
        setState(() {
          AppConstants.elementsList.add(ElementTypes(
              elementName: "CheckBox",
              element: FbCheckBox(),
              elementId: "Check${AppConstants.elementID}"));
        });
        break;
      case 8:
        setState(() {
          AppConstants.elementsList.add(ElementTypes(
              elementName: "Number",
              element: FbNumber(),
              elementId: "Number${AppConstants.elementID}"));
        });
        break;
        case 9:
        setState(() {
          AppConstants.elementsList.add(ElementTypes(
              elementName: "Date",
              element: FbDatePicker(),
              elementId: "Date${AppConstants.elementID}"));
        });
        break;
      case 10:
        setState(() {
          AppConstants.elementsList.add(ElementTypes(
              elementName: "File",
              element: FbFilePicker(),
              elementId: "File${AppConstants.elementID}"));
        });
        break;
      case 11:
        setState(() {
          AppConstants.elementsList.add(ElementTypes(
              elementName: "Signature",
              element: FbSignaturePad(),
              elementId: "Signature${AppConstants.elementID}"));
        });
    }
  }

  @override
  void initState() {
    AppConstants.elementsList.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Builder Screen"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: showList(),
              ),
            ),
            Divider(
              thickness: 2.0,
              color: Colors.blue,
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: AppConstants.fieldList.length,
                        itemBuilder: (context, item) {
                          return BottomListTile(
                            callback: () {
                              setState(() {
                                addElements(AppConstants.fieldList[item].key);
                                AppConstants.elementID++;
                              });
                            },
                            title: AppConstants.fieldList[item].type,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
