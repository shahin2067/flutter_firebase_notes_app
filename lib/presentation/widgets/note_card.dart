import 'package:flutter/material.dart';
import 'package:flutter_firebase_note_app/domain/note_model.dart';
import 'package:flutter_firebase_note_app/style/app_style.dart';

Widget noteCard(Function()? onTap, NoteModel note) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppStyle.cardsColor[note.colorId],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            note.noteTitle,
            style: AppStyle.mainTitle,
          ),
          const SizedBox(height: 5.0),
          Text(
            note.creationDate,
            style: AppStyle.dateTitle,
          ),
          const SizedBox(height: 10.0),
          Text(
            note.noteContent,
            style: AppStyle.mainContent,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}


// Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
//   return InkWell(
//     child: Container(
//       padding: const EdgeInsets.all(8.0),
//       margin: const EdgeInsets.all(8.0),
//       decoration: BoxDecoration(
//         color: AppStyle.cardsColor[doc['color_id']],
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Column(
//         children: [
//           Text(
//             doc["note_title"],
//             style: AppStyle.mainTitle,
//           ),
//           const SizedBox(
//             height: 4.0,
//           ),
//           Text(
//             doc["creation_date"],
//             style: AppStyle.dateTitle,
//           ),
//           const SizedBox(
//             height: 8.0,
//           ),
//           Text(
//             doc["note_content"],
//             style: AppStyle.mainContent,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ],
//       ),
//     ),
//   );
// }
