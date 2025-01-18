import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:weisro/feature/ads/data/models/ads_model.dart';
import 'package:weisro/generated/l10n.dart';

class EditAdDialog extends StatefulWidget {
  const EditAdDialog({
    super.key,
    required this.ad,
    required this.onSave,
  });

  final Docs ad;
  final Function(String newText, String? newImage) onSave;

  @override
  EditAdDialogState createState() => EditAdDialogState();
}

class EditAdDialogState extends State<EditAdDialog> {
  late TextEditingController textController;
  late String? selectedImage;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: widget.ad.text);
    selectedImage = widget.ad.image;
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedImage = pickedFile.path; // Save the selected image path
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).Edit_Ad),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: S.of(context).Ad_Text,
              ),
            ),
            const SizedBox(height: 10),
            if (selectedImage != null)
              selectedImage!.startsWith('http')
                  ? CachedNetworkImage(
                      height: 100,
                      imageUrl: selectedImage!,
                    )
                  : Image.file(
                      File(selectedImage!),
                      height: 100,
                    ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.image),
              label: Text(S.of(context).Select_Image),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(S.of(context).Cancel),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onSave(textController.text, selectedImage);
            Navigator.of(context).pop();
          },
          child: Text(S.of(context).Save),
        ),
      ],
    );
  }
}
