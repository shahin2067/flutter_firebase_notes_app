import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_note_app/domain/note_model.dart';
import 'package:flutter_firebase_note_app/style/app_style.dart';

// ignore: must_be_immutable
class NoteReaderScreen extends StatefulWidget {
  NoteReaderScreen(this.note, {super.key});
  NoteModel note;

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    int colorId = widget.note.colorId;
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[colorId],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[colorId],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.note.noteTitle,
              style: AppStyle.mainTitle,
            ),
            const SizedBox(height: 5.0),
            Text(
              widget.note.creationDate,
              style: AppStyle.dateTitle,
            ),
            const SizedBox(height: 20.0),
            Text(
              widget.note.noteContent,
              style: AppStyle.mainContent,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}


// class NoteReaderScreen extends StatefulWidget {
//   NoteReaderScreen(this.doc, {super.key});
//   QueryDocumentSnapshot doc;

//   @override
//   State<NoteReaderScreen> createState() => _NoteReaderScreenState();
// }

// class _NoteReaderScreenState extends State<NoteReaderScreen> {
//   @override
//   Widget build(BuildContext context) {
//     int colorId = widget.doc['color_id'];
//     return Scaffold(
//       backgroundColor: AppStyle.cardsColor[colorId],
//       appBar: AppBar(
//         backgroundColor: AppStyle.cardsColor[colorId],
//         elevation: 0.0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.doc["note_title"],
//               style: AppStyle.mainTitle,
//             ),
//             const SizedBox(height: 5.0),
//             Text(
//               widget.doc["creation_date"],
//               style: AppStyle.dateTitle,
//             ),
//             const SizedBox(height: 20.0),
//             Text(
//               widget.doc["note_content"],
//               style: AppStyle.mainContent,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
