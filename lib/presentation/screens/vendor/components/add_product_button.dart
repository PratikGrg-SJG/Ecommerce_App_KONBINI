import 'package:flutter/material.dart';
import 'package:konbini/config/theme.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: baseColor,
      ),
      onPressed: () {
        Navigator.pushNamed(context, "/vendorAddProduct");
      },
      icon: const Icon(Icons.add),
      label: const Text('Add Product'),
    );
  }
}
