import 'package:block_notes_flutter/models/NotesOperation.dart';
import 'package:block_notes_flutter/screens/add_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:block_notes_flutter/models/Note.dart';
import 'package:block_notes_flutter/screens/add_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddScreen()));
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.lightBlue,
        ),
        backgroundColor: Colors.white,
      ),
      appBar: AppBar(
        title: Text('Notes'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<NotesOperation>(
        builder: (context, NotesOperation data, child) {
          return ListView.builder(
            itemCount: data.getNotes.length,
            itemBuilder: (context, index) {
              return NotesCard(data.getNotes[index]);
            },
          );
        },
      ),
    );
  }
}

class NotesCard extends StatelessWidget {
  final Note note;

  NotesCard(this.note);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(note.description, style: TextStyle(fontSize: 17))
          ],
        ));
  }
}
