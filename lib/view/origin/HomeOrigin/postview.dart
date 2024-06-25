import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final _formKey = GlobalKey<FormState>();

  // String? name;
  String? phone;
  String? location;
  File? imageFile;

  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  void createPost() {
    if (_formKey.currentState!.validate()) {
      // Perform actions to create the post using the entered data
      // You can access the entered values using the 'name!', 'phone!', 'location!', and 'imageFile' variables
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Create Post'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding:const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [

              TextFormField(
                decoration:const InputDecoration(
                  fillColor: Color(0xffEEEEEE),
                  filled: true,
                  labelText: 'Phone',
                  border: OutlineInputBorder(
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number.';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    phone = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  fillColor: Color(0xffEEEEEE),
                  filled: true,
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a location.';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    location = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                maxLines: 5,
                decoration: const InputDecoration(
                  fillColor: Color(0xffEEEEEE),
                  filled: true,
                  border: InputBorder.none,
                  //  borderRadius: BorderRadius.circular(8.0),

                  hintText: 'What\'s Content',
                  hintStyle: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 16.0),

              InkWell(
                onTap: pickImage,
                child: Container(
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Colors.grey[400]!,
                      width: 1.0,
                    ),
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    size: 40.0,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              if (imageFile != null)
                Image.file(
                  imageFile!,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                onPressed: createPost,
                child:  Text('Create Post'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




