import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:umt_news_app/models/news.dart';
import 'dart:io';

class AddNewsPage extends StatefulWidget {
  final Function(News) onNewsAdded;

  const AddNewsPage({super.key, required this.onNewsAdded});

  @override
  _AddNewsPageState createState() => _AddNewsPageState();
}

class _AddNewsPageState extends State<AddNewsPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  String _selectedCategory = 'Academic'; // Default category
  final DateTime _dateAdded = DateTime.now();
  String _imageUrl = ""; // Variable nak simpan url image

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageUrl = pickedFile.path;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create News'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              DropdownButtonFormField(
                value: _selectedCategory,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value.toString();
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: 'Club',
                    child: Row(
                      children: [
                        Icon(Icons.group),
                        SizedBox(width: 8.0),
                        Text('Club'),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Academic',
                    child: Row(
                      children: [
                        Icon(Icons.school),
                        SizedBox(width: 8.0),
                        Text('Academic'),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Sports',
                    child: Row(
                      children: [
                        Icon(Icons.sports_soccer),
                        SizedBox(width: 8.0),
                        Text('Sports'),
                      ],
                    ),
                  ),
                ],
                decoration: const InputDecoration(labelText: 'News Category'),
              ),
              const SizedBox(height: 16.0),

              _buildImageContainer(),

              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('Pick Image'),
              ),
              const SizedBox(height: 16.0),

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
              TextFormField(
                controller: _authorController,
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
                  labelText: 'Author',
                  hintText: 'Add author',
                ),
              ),
              
              
              const SizedBox(height: 16.0),
              
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  String title = _titleController.text;
                  String description = _descriptionController.text;
                  String author = _authorController.text;

                  if (title.isNotEmpty && description.isNotEmpty) {
                    widget.onNewsAdded(
                      News(
                        title: title,
                        author: author,
                        description: description,
                        category: _selectedCategory,
                        dateAdded: _dateAdded,
                        imageUrl: _imageUrl,
                      ),
                    );
                    Navigator.pop(context); // Close the AddNewsPage
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageContainer() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(width: 3),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: _imageUrl.isNotEmpty
          ? Image.file(
              File(_imageUrl),
              fit: BoxFit.cover,
            )
          : const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.photo_library_outlined,
                  size: 40,
                  //color: Colors.indigo,
                ),
                SizedBox(height: 8.0),
                Text(
                  'Please upload an image',
                  style: TextStyle(
                    //color: Colors.indigo,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
    );
  }
}
