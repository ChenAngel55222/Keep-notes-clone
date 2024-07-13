import 'package:flutter/material.dart';
import 'package:keep_notes/colors.dart';
import 'package:keep_notes/editNoteView.dart';
import 'package:keep_notes/model/myNoteModel.dart';
import 'package:keep_notes/home.dart';
import 'package:keep_notes/services/db.dart';
// import 'package:keep_notes/archiveView.dart';

class NoteView extends StatefulWidget {
  final Note note;
  NoteView({required this.note});

  @override
  _NoteViewState createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   print(widget.note!.pin);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: backgroundColor,
        elevation: 0.0,
        actions: [
          IconButton(
            splashRadius: 17,
            onPressed: () async {
              await NotesDataBase.instance.pinNote(widget.note);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            icon: Icon(
                widget.note.pin ? Icons.push_pin : Icons.push_pin_outlined),
          ),
          IconButton(
            splashRadius: 17,
            onPressed: () async {
              await NotesDataBase.instance.archNote(widget.note);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            icon: Icon(widget.note.isArchieve
                ? Icons.archive
                : Icons.archive_outlined),
          ),
          IconButton(
            splashRadius: 17,
            onPressed: () async {
              await NotesDataBase.instance.deleteNote(widget.note);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            icon: Icon(Icons.delete_forever_outlined),
          ),
          IconButton(
            splashRadius: 17,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditNoteView(note: widget.note)));
            },
            icon: Icon(Icons.edit_outlined),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.note.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.note.content,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
