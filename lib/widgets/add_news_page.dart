import 'package:flutter/material.dart';
//import 'package:umt_news_app/widgets/home_page.dart';
import 'package:umt_news_app/models/news.dart';

class AddNewsPage extends StatefulWidget {
  final Function(News) onNewsAdded;

  AddNewsPage({required this.onNewsAdded});

  @override
  _AddNewsPageState createState() => _AddNewsPageState();
}

class _AddNewsPageState extends State<AddNewsPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedCategory = 'Club'; // Default category
  DateTime _dateAdded = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create News'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              textInputAction: TextInputAction.next,
              maxLines: null, // Allows the field to dynamically adjust its height
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    width: 3,
                    color: Colors.indigo,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    width: 3,
                    color: Colors.indigo,
                  ),
                ),
                labelText: 'Title',
                hintText: 'Add news title',
              ),
            ),

            const SizedBox(height: 16.0),

            // TextFormField(
            //   controller: _descriptionController,
            //   textInputAction: TextInputAction.next,
            //   decoration: InputDecoration(
            //     enabledBorder: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10.0), // Set the border radius here
            //       borderSide: const BorderSide(
            //         width: 3, 
            //         color: Colors.indigo,
            //       ),
            //     ),
            //     labelText: 'Description',
            //     hintText: 'Add description',
            //   ),
            // ),

            // const SizedBox(height: 16.0),
            TextFormField(
              controller: _descriptionController,
              textInputAction: TextInputAction.next,
              maxLines: null, // Allows the field to dynamically adjust its height
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    width: 3,
                    color: Colors.indigo,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    width: 3,
                    color: Colors.indigo,
                  ),
                ),
                labelText: 'Description',
                hintText: 'Add description',
              ),
            ),

            const SizedBox(height: 16.0),


            DropdownButtonFormField(
              value: _selectedCategory,
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value.toString();
                });
              },
              items: ['Club', 'Academic', 'Sports'].map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
              decoration: const InputDecoration(labelText: 'News Category'),
            ),
            SizedBox(height: 16.0),

            ElevatedButton(
              onPressed: () {
                String title = _titleController.text;
                String description = _descriptionController.text;

                if (title.isNotEmpty && description.isNotEmpty) {
                  widget.onNewsAdded(
                    News(
                      title: title,
                      description: description,
                      category: _selectedCategory,
                      dateAdded: _dateAdded,
                    ),
                  );
                  Navigator.pop(context); // Close the AddNewsPage
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
