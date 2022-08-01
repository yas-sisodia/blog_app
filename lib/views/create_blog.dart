// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:flutter/material.dart';

import '../services/crud.dart';

import 'package:image_picker/image_picker.dart';

import 'dart:io';

class CreateBlog extends StatefulWidget {
   CreateBlog({Key? key}) : super(key: key);

  @override
  State<CreateBlog> createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  String? authorName, title, desc;

  late File selectedImage = File("/PHOTO.jpg");
  // var selectedImage;
  CrudMethods crudMethods = new CrudMethods();
  ImagePicker imagePicker = ImagePicker();

  Future getImage() async {
    // var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    var image = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = image as File;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables, duplicate_ignore
          children: [
            // ignore: prefer_const_constructors
            Text("Flutter",
                style: TextStyle(
                  color: Colors.white,
                )),
            // ignore: prefer_const_constructors
            Text(
              "Blog",
              style: TextStyle(color: Colors.blue, fontSize: 22),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          // ignore: prefer_const_constructors
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.upload))
        ],
      ),
      // ignore: prefer_const_constructors, avoid_unnecessary_containers
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                getImage();
              },
              child: selectedImage != (null) ? Container(
                //  child: Image.file(selectedImage),
                 margin: EdgeInsets.symmetric(horizontal: 10),
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Image.file(selectedImage),

              ) : Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(6)),
                width: MediaQuery.of(context).size.width,
                child: Icon(
                  Icons.add_a_photo,
                  color: Colors.black45,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(hintText: "Author Name"),
                      onChanged: (val){
                        authorName = val;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Title"),
                        onChanged: (val){
                          title = val;
                        },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Description"),
                        onChanged: (val){
                          desc = val;
                        },
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
