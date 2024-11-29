import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/feature/services/presentation/managers/add_service_cubit/add_service_cubit.dart';

class UploadContainer extends StatefulWidget {
  const UploadContainer({
    super.key,
  });

  @override
  State<UploadContainer> createState() => _UploadContainerState();
}

class _UploadContainerState extends State<UploadContainer> {
  final List<File> _selectedImages = [];

  Future<void> _pickImages() async {
    final picker = ImagePicker();

    final pickedFiles = await picker.pickMultiImage();
    final resizedImages = await Future.wait(
      pickedFiles.map((pickedFile) async {
        final imageFile = File(pickedFile.path);
        return HelperFunctions.resizeImage(imageFile);
      }),
    );
    setState(() {
      _selectedImages.addAll(resizedImages);
      BlocProvider.of<AddServiceCubit>(context)
          .imagePaths
          .addAll(resizedImages.map((file) => file.path));
      log("This Image Path ${BlocProvider.of<AddServiceCubit>(context).imagePaths}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await _pickImages();
      },
      child: Container(
        height: 220,
        margin: HelperFunctions.symmetricHorizontalPadding24,
        decoration: const BoxDecoration(
          color: AppColors.second1Color,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: _selectedImages.isEmpty
            ? Center(
                child: SvgPicture.asset(IconsPath.iconsPhotoUpload),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: _selectedImages.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Display 3 images per row
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        _selectedImages[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
