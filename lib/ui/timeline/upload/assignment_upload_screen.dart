import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AssigmentUploadScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AssignmentUploadScreenState();
  }
}

class _AssignmentUploadScreenState extends State<AssigmentUploadScreen> {
  String availableDate;
  String expireDate;

  String _fileName;
  List<String> files;
  String _path;
  Map<String, String> _paths;
  List<String> paths;
  String _extension;
  bool _multiPick = true;
  bool _hasValidMime = false;
  FileType _pickingType = FileType.ANY;
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  void _openFileExplorer() async {
    if (_pickingType != FileType.CUSTOM || _hasValidMime) {
      try {
        if (_multiPick) {
          _path = null;
          _paths = await FilePicker.getMultiFilePath(
              type: _pickingType, fileExtension: _extension);
        } else {
          _paths = null;
          _path = await FilePicker.getFilePath(
              type: _pickingType, fileExtension: _extension);
        }
      } on PlatformException catch (e) {
        print("Unsupported operation" + e.toString());
      }
      if (!mounted) return;

      setState(() {
        _fileName = _path != null
            ? _path.split('/').last
            : _paths != null ? _paths.keys.toString() : null;
        files = getListOfString(_fileName);
        paths = getListOfString(_paths.values.toString());
      });
    }
  }

  List<String> getListOfString(String value) {
    value = value.replaceFirst("(", "");
    value = value.replaceFirst(")", "");
    return value.split(",");
  }

  Widget getDocumentTypeIcon(String file) {
    String ext = file.split(".").last;
    switch (ext) {
      case 'pdf':
        return Icon(
          FontAwesomeIcons.filePdf,
          color: Colors.redAccent,
        );
      case 'png':
        return Icon(
          FontAwesomeIcons.image,
          color: Colors.redAccent,
        );
      case 'ppt':
        return Icon(
          FontAwesomeIcons.filePowerpoint,
          color: Colors.redAccent,
        );
      case 'doc':
        return Icon(
          FontAwesomeIcons.fileWord,
          color: Colors.redAccent,
        );
      default:
        return Icon(
          FontAwesomeIcons.fileArchive,
          color: Colors.redAccent,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.file_upload,
              color: Colors.white,
            ),
            onPressed: () {
              //  Navigator.pushNamed(context, '/activities/Add Member');
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[bodyBuilder()],
      ),
    );
  }

  Widget bodyBuilder() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        children: <Widget>[
          titleBuilder(),
          descriptionBuilder(),
          pointBuilder(),
          availableDatePicker(),
          expireDatePicker(),
          uploadButtonBuilder(),
        ],
      ),
    );
  }

  Widget titleBuilder() {
    return TextField(
      decoration: InputDecoration(labelText: "Title", hintText: "Title"),
    );
  }

  Widget pointBuilder() {
    return TextField(
      decoration: InputDecoration(labelText: "Points", hintText: "Points"),
      keyboardType: TextInputType.number,
    );
  }

  Widget descriptionBuilder() {
    return TextField(
      decoration:
          InputDecoration(labelText: "Description", hintText: "Description"),
    );
  }

  Widget availableDatePicker() {
    return Row(
      children: <Widget>[
        Text("Available Date: "),
        Text(availableDate ?? ''),
        IconButton(
          icon: Icon(Icons.arrow_drop_down),
          onPressed: () async {
            final selectedDate = await selectDate();
            setState(() {
              availableDate = selectedDate;
            });
          },
        )
      ],
    );
  }

  Widget expireDatePicker() {
    return Row(
      children: <Widget>[
        Text("Expire Date: "),
        Text(expireDate ?? ''),
        IconButton(
          icon: Icon(Icons.arrow_drop_down),
          onPressed: () async {
            final selectedDate = await selectDate();
            setState(() {
              expireDate = selectedDate;
            });
          },
        )
      ],
    );
  }

  Widget uploadButtonBuilder() {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: new Center(
        child: new Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: new SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: FlatButton(
                        child: Text("Upload File"),
                        textColor: Colors.white,
                        color: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        onPressed: _openFileExplorer,
                      ),
                    ),
                  ],
                ),
                files != null && paths != null
                    ? Container(
                        padding: EdgeInsets.only(top: 10),
                        margin: EdgeInsets.only(right: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "File",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            Column(
                              children: fileBuilder(files, paths),
                            ),
                          ],
                        ),
                      )
                    : Text('')
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> fileBuilder(List<String> files, List<String> paths) {
    return files.map((file) {
      return Padding(
        padding: EdgeInsets.only(top: 10),
        child: Row(
          children: <Widget>[
            getDocumentTypeIcon(file),
            Expanded(
              flex: 1,
              child: Text(
                file,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.solidEye),
              onPressed: () {
                Navigator.pushNamed(
                    context, '/view_pdf/${paths[files.indexOf(file)]}');
              },
            )
          ],
        ),
      );
    }).toList();
  }

  Future<String> selectDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark(),
          child: child,
        );
      },
    );
    final formatter = new DateFormat('dd-MMM-yyyy');
    return formatter.format(selectedDate);
  }
}
