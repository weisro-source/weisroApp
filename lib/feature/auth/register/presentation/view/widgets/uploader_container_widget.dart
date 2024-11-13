import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/generated/l10n.dart';

class UploaderContainerWidget extends StatefulWidget {
  const UploaderContainerWidget({
    Key? key,
    this.hintText,
    this.isMultiPick = true,
  }) : super(key: key);

  final String? hintText;
  final bool isMultiPick;

  @override
  UploaderContainerWidgetState createState() => UploaderContainerWidgetState();
}

class UploaderContainerWidgetState extends State<UploaderContainerWidget> {
  List<File> _selectedImages = [];

  Future<void> _pickImages() async {
    final picker = ImagePicker();

    if (widget.isMultiPick) {
      final pickedFiles = await picker.pickMultiImage();
      final resizedImages = await Future.wait(
        pickedFiles.map((pickedFile) async {
          final imageFile = File(pickedFile.path);
          return HelperFunctions.resizeImage(imageFile);
        }),
      );
      setState(() {
        _selectedImages = resizedImages;
      });
    } else {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final resizedImage =
            await HelperFunctions.resizeImage(File(pickedFile.path));
        setState(() {
          _selectedImages = [resizedImage];
        });
      }
    }
  }

  // Handles single image capture from camera with resizing
  Future<void> _captureImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final resizedImage =
          await HelperFunctions.resizeImage(File(pickedFile.path));
      setState(() {
        if (widget.isMultiPick) {
          _selectedImages.add(resizedImage);
        } else {
          _selectedImages = [resizedImage];
        }
      });
    }
  }

  // Dialog for choosing gallery or camera
  void _showImageSourceDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text(S.of(context).Pick_From_Gallery),
              onTap: () {
                Navigator.pop(context);
                _pickImages();
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text(S.of(context).Take_Photo),
              onTap: () {
                Navigator.pop(context);
                _captureImage();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showImageSourceDialog(context),
      child: Container(
        width: 314,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.orangeColor),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 10),
                child: Text(
                  widget.hintText ?? "",
                  style: AppStyles.style10w400Second2(context),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: widget.isMultiPick
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _selectedImages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Image.file(
                            _selectedImages[index],
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    )
                  : _selectedImages.isNotEmpty
                      ? Image.file(
                          _selectedImages[0],
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        )
                      : Center(child: SvgPicture.asset(IconsPath.iconsPhoto)),
            ),
          ],
        ),
      ),
    );
  }
}
