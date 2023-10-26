import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:konbini/config/theme.dart';
import 'package:konbini/services/firebase_service.dart';

class AdminCategoryList extends StatefulWidget {
  const AdminCategoryList({super.key, required this.editCategory});

  final void Function(String categoryName, String url) editCategory;

  @override
  State<AdminCategoryList> createState() => _AdminCategoryListState();
}

class _AdminCategoryListState extends State<AdminCategoryList> {
  final FirebaseService _service = FirebaseService();

  void deleteCategory(String categoryId) {
    // Show a confirmation dialog to confirm the deletion.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          title: const Text("Confirm Delete"),
          content: const Text("Are you sure you want to delete this category?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(color: baseColor),
              ),
            ),
            TextButton(
              onPressed: () {
                _service.deleteCategory(categoryId);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.red,
                    content: Text('Category successfully deleted !'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text(
                "Delete",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    FirebaseService service = FirebaseService();
    return StreamBuilder<QuerySnapshot>(
      stream: service.category.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.data!.size == 0) {
          return const Center(child: Text("No Categories Found"));
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListTile(
              leading: SizedBox(
                width: 30,
                child: CachedNetworkImage(
                  imageUrl: data['image'].toString(),
                  height: 30,
                ),
              ),
              title: Text(data['categoryName']),
              trailing: PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert),
                onSelected: (value) {
                  if (value == 'edit') {
                    String categoryName = data['categoryName'];
                    String url = data['image'];

                    widget.editCategory(categoryName, url);
                  } else if (value == 'delete') {
                    String categoryId = document.id;
                    deleteCategory(categoryId);
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem<String>(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(Icons.edit, color: Colors.black),
                          SizedBox(width: 8),
                          Text('Edit'),
                        ],
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete, color: Colors.red),
                          SizedBox(width: 8),
                          Text('Delete', style: TextStyle(color: Colors.red)),
                        ],
                      ),
                    ),
                  ];
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
