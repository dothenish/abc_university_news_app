import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:umt_news_app/models/news.dart';
import 'dart:io';

final _formKey = GlobalKey<FormState>();

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
        title: Text('Create News',
        style: GoogleFonts.nunito(
          fontWeight: FontWeight.bold
        ),),
        backgroundColor: Colors.teal,
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.close),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                TextFormField(
                  controller: _titleController,
                  textInputAction: TextInputAction.next,
                  maxLines: null, // adjust height
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 3,
                        color: Colors.teal,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 3,
                        color: Colors.teal,
                      ),
                    ),
                    labelText: 'Title',
                    hintText: 'Add news title',
                  ),
                  // validator: (title) {
                  //   if (title == null || title.isEmpty) {
                  //     return 'Please enter news title';
                  //   }
                  //   return null;
                  // },
                  validator: (title) => title == null || title.isEmpty
                  ? 'Please enter news title'
                  : null,
                ),

                DropdownButtonFormField(
                  value: _selectedCategory,
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value.toString();
                    });
                  },
                  items: const [
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
                  style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[100],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0), 
                          ),
                           padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, 
                            vertical: 16.0),
                            minimumSize: const Size(100.0, 40.0),
                          ),
                  child: Text('Pick Image',
                  style: GoogleFonts.nunito(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),),
                ),

                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _descriptionController,
                  textInputAction: TextInputAction.next,
                  maxLines: null, //adjust height
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 3,
                        color: Colors.teal,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 3,
                        color: Colors.teal,
                      ),
                    ),
                    labelText: 'Description',
                    hintText: 'Add description',
                  ),
                  validator: (description) => description == null || description.isEmpty
                  ? 'Please enter description'
                  : null,
                ),

                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _authorController,
                  textInputAction: TextInputAction.next,
                  maxLines: null, // adjust height
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 3,
                        color: Colors.teal,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        width: 3,
                        color: Colors.teal,
                      ),
                    ),
                    labelText: 'Author',
                    hintText: 'Add author',
                  ),
                  validator: (author) => author == null || author.isEmpty
                  ? 'Please enter author'
                  : null,
                ),
                
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.validate();

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
                      Navigator.pop(context); // Close AddNewsPage
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, 
                        vertical: 16.0),
                        minimumSize: const Size(200.0, 40.0),
                        ),
                        child: Text('Publish',
                        style: GoogleFonts.nunito(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),),
                ),
              ],
            ),
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
        border: Border.all(
          width: 3,
          color: Colors.teal),
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
                ),
                SizedBox(height: 8.0),
                Text('Please upload an image'),
                ],
              ),
    );
  }
}
