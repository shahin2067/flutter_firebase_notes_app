import 'package:flutter/material.dart';
import 'package:flutter_firebase_note_app/application/note_provider/note_provider.dart';
import 'package:flutter_firebase_note_app/presentation/screens/note_editor.dart';
import 'package:flutter_firebase_note_app/presentation/screens/note_reader.dart';
import 'package:flutter_firebase_note_app/style/app_style.dart';
import 'package:flutter_firebase_note_app/presentation/widgets/note_card.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 100), () {
        ref.read(noteProvider.notifier).getNote();
      });
      return null;
    }, []);
    final notes = ref.watch(noteProvider.select((value) => value.notess));
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('FireNotes'),
        centerTitle: true,
        backgroundColor: AppStyle.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Recent Notes',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            if (notes.isNotEmpty)
              Expanded(
                  child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                children: notes
                    .map((note) => noteCard(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NoteReaderScreen(note)));
                        }, note))
                    .toList(),
              )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const NoteEditorScreen()));
        },
        label: const Text("Add Note"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppStyle.mainColor,
//       appBar: AppBar(
//         elevation: 0.0,
//         title: const Text('FireNotes'),
//         centerTitle: true,
//         backgroundColor: AppStyle.mainColor,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Your recent NOtes',
//               style: GoogleFonts.roboto(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 22),
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             Expanded(
//               child: StreamBuilder<QuerySnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection("Notes")
//                       .snapshots(),
//                   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                     // checking the connection state, if we still load the data we can display a progress
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//                     if (snapshot.hasData) {
//                       return GridView(
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 2),
//                         children: snapshot.data!.docs
//                             .map((note) => noteCard(() {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               NoteReaderScreen(note)));
//                                 }, note))
//                             .toList(),
//                       );
//                     }
//                     return Text(
//                       "there's no Notes",
//                       style: GoogleFonts.nunito(color: Colors.white),
//                     );
//                   }),
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => NoteEditorScreen()));
//         },
//         label: Text("Add Note"),
//         icon: const Icon(Icons.add),
//       ),
//     );
//   }
// }
