import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/generated/l10n.dart';

import '../../../../core/widgets/remove_image_icon.dart';

/// Function to pick and resize an image
Future<File?> pickImageWithResize(
    ImageSource source, ImagePicker picker) async {
  final XFile? pickedFile = await picker.pickImage(source: source);
  if (pickedFile == null) return null;
  return await HelperFunctions.resizeImage(File(pickedFile.path));
}

/// Widget for the input area including the text field and image picker
class CreateAdInputArea extends StatelessWidget {
  final TextEditingController textController;
  final File? selectedImage;
  final VoidCallback onRemoveImage;
  final VoidCallback onPickImageFromGallery;
  final VoidCallback onPickImageFromCamera;

  const CreateAdInputArea({
    Key? key,
    required this.textController,
    required this.selectedImage,
    required this.onRemoveImage,
    required this.onPickImageFromGallery,
    required this.onPickImageFromCamera,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 201,
      width: HelperFunctions.getScreenWidth(context),
      margin: HelperFunctions.symmetricHorizontalPadding34,
      decoration: BoxDecoration(
        color: AppColors.second1Color,
        border: Border.all(color: AppColors.orangeColor, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 7),
                  child: TextFormField(
                    controller: textController,
                    maxLines: 2,
                    decoration:
                        InputDecoration(hintText: S.of(context).add_text_here),
                  ),
                ),
                10.kh,
                Container(
                  height: 100,
                  width: double.infinity,
                  margin: const EdgeInsetsDirectional.only(end: 10, start: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: selectedImage == null
                      ? const Center(child: SizedBox())
                      : Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.file(
                              selectedImage!,
                              fit: BoxFit.cover,
                            ),
                            RemoveImageIcon(onRemoveImage: onRemoveImage)
                          ],
                        ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: VerticalDivider(
              thickness: 1,
              width: 1,
              color: Colors.grey,
              endIndent: 40,
            ),
          ),
          Column(
            children: [
              70.kh,
              IconButton(
                onPressed: onPickImageFromGallery,
                icon: SvgPicture.asset(
                  IconsPath.iconsPhoto,
                  width: 24,
                  height: 24,
                ),
              ),
              IconButton(
                onPressed: onPickImageFromCamera,
                icon: SvgPicture.asset(IconsPath.iconsCamera,
                    width: 24, height: 24),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
