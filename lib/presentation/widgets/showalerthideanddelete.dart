import 'package:flutter/material.dart';

void showDeleteConfirmationDialog(BuildContext context, String? id,
    String? title, String? content, String? typedeleteorhide) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("$title"),
        content: Text("$content"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pop(); // Close the dialog without doing anything
            },
            child: Text("Cancel"),
          ),
          typedeleteorhide == 'hide'
              ? TextButton(
                  onPressed: () {
                    // Handle deletion here
                    // Navigator.of(context).pop(); // Close the dialog
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(content: Text('Item hide')),
                    // );
                  },
                  child: Text(
                    "$typedeleteorhide",
                    style: TextStyle(color: Colors.red),
                  ),
                )
              : TextButton(
                  onPressed: () {
                    // Handle deletion here
                    // Navigator.of(context).pop(); // Close the dialog
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(content: Text('Item delete')),
                    // );
                  },
                  child: Text(
                    "$typedeleteorhide",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
        ],
      );
    },
  );
}
