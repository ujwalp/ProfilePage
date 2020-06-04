import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:ProfilePage/editprofile.dart';

void main() {
  runApp(ProfilePage());
}

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File _pickedImage;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _pickedImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      radius: 80,
                      child: _pickedImage == null ? Text("Picture") : null,
                      backgroundImage:
                          _pickedImage != null ? FileImage(_pickedImage) : null,
                    ),
                  ),
                  RaisedButton(
                    child: Text("Pick Image"),
                    onPressed: getImage,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            return FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditProfile(),
                                  ),
                                );
                              },
                              child: Center(
                                child: Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 10.0),
                    padding: EdgeInsets.all(5.0),
                    width: 300.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(
                        color: Colors.black45,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      'Username',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 20.0),
                    padding: EdgeInsets.all(5.0),
                    width: 350.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      border: Border.all(
                        color: Colors.black45,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 20.0),
                    padding: EdgeInsets.all(5.0),
                    width: 380.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.lightGreenAccent,
                      border: Border.all(
                        color: Colors.black45,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      'Address',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 20.0),
                    padding: EdgeInsets.all(5.0),
                    width: 400.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(
                        color: Colors.black45,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      'Bio',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
