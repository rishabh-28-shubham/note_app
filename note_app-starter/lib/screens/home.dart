import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/constants/colors.dart';
import 'package:note_app/models/note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  getRandomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt((backgroundColors.length))];
  }

void onSearchTextChanged(String searchText) {
    setState(() {
      var filteredNotes = sampleNotes
          .where((note) =>
              note.content.toLowerCase().contains(searchText.toLowerCase()) ||
              note.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                //setting icon button
                IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.all(0),
                    icon: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade800.withOpacity(.8),
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.sort,
                          color: Colors.white,
                        ))),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              style: TextStyle(fontSize: 16, color: Colors.white),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                  hintText: "Search Notes",
                  hintStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.grey.shade700,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.transparent),
                  )),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ListView.builder(
                  itemCount: sampleNotes.length,
                  itemBuilder: (context, index) {
                    return Card(
                        margin: EdgeInsets.only(bottom: 20),
                        color: getRandomColor(),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
                              title: RichText(
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                    text: '${sampleNotes[index].title} \n',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 18,
                                        height: 1.5),
                                    children: [
                                      TextSpan(
                                          text: sampleNotes[index].content,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              height: 1.5))
                                    ]),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "${DateFormat('EEE MMM d, yyyy h:mm a').format(sampleNotes[index].modifiedTime)}",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 10,
                                      color: Colors.grey.shade800),
                                ),
                              ),
                              trailing: IconButton(
                                  onPressed: () {}, icon: Icon(Icons.delete))),
                        ));
                  },
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.grey.shade800,
        elevation: 10,
        child: Icon(Icons.add, size: 38, color: Colors.white),
      ),
    );
  }
}
