// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:blog_app/views/create_blog.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables, duplicate_ignore
        children: [
          Text("Flutter", style: TextStyle(
            color: Colors.white,
          )),
          // ignore: prefer_const_constructors
          Text("Blog", style: TextStyle(
            color: Colors.blue,
            fontSize: 22
          ),
          )
        ],
       ),
       backgroundColor: Colors.transparent,
      ),

      body: Container(),
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CreateBlog()));
              },
              child: Icon(Icons.add_a_photo),
            )
          ],
        ),
      ),
    );
  }
}