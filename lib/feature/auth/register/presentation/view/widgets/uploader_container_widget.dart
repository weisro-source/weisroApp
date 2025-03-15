import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/widgets/full_screen_image.dart';
import 'package:weisro/feature/auth/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:weisro/generated/l10n.dart';

class UploaderContainerWidget extends StatefulWidget {
  const UploaderContainerWidget({
    Key? key,
    this.hintText,
    this.isMultiPick = true,
    required this.isForId,
  }) : super(key: key);

  final String? hintText;
  final bool isMultiPick;
  final bool isForId;
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
        _selectedImages.addAll(resizedImages);
        if (widget.isForId) {
          context.read<RegisterCubit>().imagesPathsForId =
              _selectedImages.map((e) => e.path).toList();
        } else {
          context.read<RegisterCubit>().imagesPathsForWork =
              _selectedImages.map((e) => e.path).toList();
        }
      });
    } else {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final resizedImage =
            await HelperFunctions.resizeImage(File(pickedFile.path));
        setState(() {
          _selectedImages = [resizedImage];
          context.read<RegisterCubit>().imagePathForProfile =
              _selectedImages.first.path;
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

  void _removeImage(int index) {
    setState(() {
      // Remove the image from the list
      _selectedImages.removeAt(index);
      if (widget.isMultiPick) {
        if (widget.isForId) {
          context.read<RegisterCubit>().imagesPathsForId.removeAt(index);
        } else {
          context.read<RegisterCubit>().imagesPathsForWork.removeAt(index);
        }
      } else {
        context.read<RegisterCubit>().imagePathForProfile = '';
      }
      // Optionally, remove the image path from the cubit
    });
    // print(context.read<RegisterCubit>().imagesPathsForId.length);
    // print(context.read<RegisterCubit>().imagePathForProfile);
    // print(context.read<RegisterCubit>().imagesPathsForWork.length);
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
          borderRadius: const BorderRadius.all(Radius.circular(20)),
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
            SizedBox(
              height: HelperFunctions.getScreenHight(context) * 0.06,
              child: widget.isMultiPick
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _selectedImages.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: GestureDetector(
                                onLongPress: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => FullScreenImageGallery(
                                        imageList: _selectedImages
                                            .map((file) => file.path)
                                            .toList(),
                                        initialIndex: index,
                                        isReview: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Image.file(_selectedImages[index],
                                    fit: BoxFit.cover,
                                    height: HelperFunctions.getScreenHight(
                                            context) *
                                        0.07),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => _removeImage(index),
                              child: Container(
                                width: 21,
                                height: 21,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.redColor),
                                child: Center(
                                  child: Text(
                                    'X',
                                    style: AppStyles.style14w500White(context),
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    )
                  : _selectedImages.isNotEmpty
                      ? Stack(
                          children: [
                            GestureDetector(
                              onLongPress: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => FullScreenImageGallery(
                                      imageList: _selectedImages
                                          .map((file) => file.path)
                                          .toList(),
                                      initialIndex: 0,
                                      isReview: true,
                                    ),
                                  ),
                                );
                              },
                              child: Image.file(
                                _selectedImages[0],
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => _removeImage(0),
                              child: Container(
                                width: 21,
                                height: 21,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.redColor),
                                child: Center(
                                  child: Text(
                                    'X',
                                    style: AppStyles.style14w500White(context),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      : Center(child: SvgPicture.asset(IconsPath.iconsPhoto)),
            ),
          ],
        ),
      ),
    );
  }
}
