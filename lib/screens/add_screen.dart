import 'package:block_notes_flutter/models/NotesOperation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  String titleText;
  String descriptionText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: Text('Notes'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Title',
                    hintStyle: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  onChanged: (value) {
                    titleText = value;
                  },
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Description',
                      hintStyle: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    onChanged: (value) {
                      descriptionText = value;
                    },
                  ),
                ),
                FlatButton(
                    onPressed: () {
                      Provider.of<NotesOperation>(context, listen: false)
                          .addNewNote(titleText, descriptionText);
                      Navigator.pop(context);
                    },
                    color: Colors.white,
                    child: Text('Add Note',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue)))
              ],
            )));
  }
}
