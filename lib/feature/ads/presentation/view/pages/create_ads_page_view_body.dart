import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/custom_app_bar.dart';
import 'package:weisro/generated/l10n.dart';

class CreateAdsPageViewBody extends StatefulWidget {
  const CreateAdsPageViewBody({super.key});

  @override
  CreateAdsPageViewBodyState createState() => CreateAdsPageViewBodyState();
}

class CreateAdsPageViewBodyState extends State<CreateAdsPageViewBody> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _textController = TextEditingController();
  bool _isButtonEnabled = false;

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      final resizedImage =
          await HelperFunctions.resizeImage(File(pickedFile.path));
      setState(() {
        _selectedImage = resizedImage;
        _updateButtonState();
      });
    }
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled =
          _textController.text.isNotEmpty && _selectedImage != null;
    });
  }

  @override
  void initState() {
    super.initState();
    _textController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppBar(title: S.of(context).Create_An_Ad),
        SliverToBoxAdapter(
          child: 30.kh,
        ),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding34,
          sliver: SliverToBoxAdapter(
            child: Text(
              S.of(context).create_ad_you_want,
              style: AppStyles.style14w400Grey(context),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: 10.kh,
        ),
        SliverToBoxAdapter(
          child: Container(
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
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 7),
                        child: TextFormField(
                          controller: _textController,
                          maxLines: 2,
                          decoration: InputDecoration(
                              hintText: S.of(context).add_text_here),
                        ),
                      ),
                      10.kh,
                      Container(
                        height: 100,
                        width: double.infinity,
                        margin:
                            const EdgeInsetsDirectional.only(end: 10, start: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: _selectedImage == null
                            ? const Center(child: SizedBox())
                            : Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.file(
                                    _selectedImage!,
                                    fit: BoxFit.cover,
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional.topEnd,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedImage = null;
                                          _updateButtonState();
                                        });
                                      },
                                      child: Container(
                                        width: 21,
                                        height: 21,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.redColor),
                                        child: Center(
                                          child: Text(
                                            'X',
                                            style: AppStyles.style14w500White(
                                                context),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
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
                      onPressed: () => _pickImage(ImageSource.gallery),
                      icon: SvgPicture.asset(IconsPath.iconsPhoto),
                    ),
                    IconButton(
                      onPressed: () => _pickImage(ImageSource.camera),
                      icon: SvgPicture.asset(IconsPath.iconsCamera),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: 50.kh,
        ),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: SliverToBoxAdapter(
            child: AppButton(
              onPressed: _isButtonEnabled ? () {} : null,
              text: S.of(context).confirm,
            ),
          ),
        )
      ],
    );
  }
}
