import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seventh_sem_project/module/screens/admin/admin_controller.dart';

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ac = Get.find<AdminController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                _navigateToAddOrUpdateBlog(context, isUpdate: false);
              },
              child: Text('Add Blog'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _navigateToAddOrUpdateBlog(context, isUpdate: true);
              },
              child: Text('Update Blog'),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToAddOrUpdateBlog(BuildContext context, {required bool isUpdate}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddOrUpdateBlogPage(isUpdate: isUpdate),
      ),
    );
  }
}

class AddOrUpdateBlogPage extends StatefulWidget {
  final bool isUpdate;

  const AddOrUpdateBlogPage({Key? key, required this.isUpdate}) : super(key: key);

  @override
  _AddOrUpdateBlogPageState createState() => _AddOrUpdateBlogPageState();
}

class _AddOrUpdateBlogPageState extends State<AddOrUpdateBlogPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final ac = Get.find<AdminController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isUpdate ? 'Update Blog' : 'Add Blog'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image Picker
            InkWell(
              onTap: () {
                ac.onPhotoUploaded();
              },
              child: Obx(() {
                return ac.imageUrl.toString() == ''
                    ? Container(
                  height: 150,
                  width: 150,
                  color: Colors.grey[200],
                  child: Icon(Icons.camera_alt, size: 50, color: Colors.grey),
                )
                    : Image.file(
                File(ac.imageUrl.value),
                height: 150,
                width: 150,
                fit: BoxFit.cover,
                );
              }),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: 'Content',
              ),
              maxLines: 4,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add or Update Blog Logic
                if (widget.isUpdate) {
                  // Update Blog Logic
                  // Implement update functionality here
                  // Example:
                  // updateBlog(_titleController.text, _contentController.text, _imageFile);
                } else {
                  // Add Blog Logic
                  // Implement add functionality here
                  // Example:
                  // addBlog(_titleController.text, _contentController.text, _imageFile);
                }

                // Navigate back to admin home page after adding or updating
                Navigator.pop(context);
              },
              child: Text(widget.isUpdate ? 'Update' : 'Add'),
            ),
          ],
        ),
      ),
    );
  }
}
