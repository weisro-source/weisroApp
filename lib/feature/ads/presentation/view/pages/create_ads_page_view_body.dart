import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/core/widgets/custom_app_bar.dart';
import 'package:weisro/feature/ads/presentation/managers/add_ads_cubit/add_ads_cubit.dart';
import 'package:weisro/feature/ads/presentation/managers/create_ads_helpers.dart';
import 'package:weisro/generated/l10n.dart';

class CreateAdsPageViewBody extends StatefulWidget {
  const CreateAdsPageViewBody({super.key});

  @override
  CreateAdsPageViewBodyState createState() => CreateAdsPageViewBodyState();
}

class CreateAdsPageViewBodyState extends State<CreateAdsPageViewBody> {
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _textController = TextEditingController();
  File? _selectedImage;
  bool _isButtonEnabled = false;
  late CancelToken? cancelToken;
  Future<void> _pickImage(ImageSource source) async {
    final file = await pickImageWithResize(source, _picker);
    if (file != null) {
      setState(() {
        _selectedImage = file;
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
    cancelToken = CancelToken();
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
        CustomAppBar(
          title: S.of(context).Create_An_Ad,
          onPressed: () => cancelToken?.cancel(),
        ),
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
          child: CreateAdInputArea(
            textController: _textController,
            selectedImage: _selectedImage,
            onRemoveImage: () {
              setState(() {
                _selectedImage = null;
                _updateButtonState();
              });
            },
            onPickImageFromGallery: () => _pickImage(ImageSource.gallery),
            onPickImageFromCamera: () => _pickImage(ImageSource.camera),
          ),
        ),
        SliverToBoxAdapter(
          child: 50.kh,
        ),
        SliverPadding(
          padding: HelperFunctions.symmetricHorizontalPadding24,
          sliver: SliverToBoxAdapter(
            child: AppButton(
              onPressed: _isButtonEnabled
                  ? () async {
                      if (_textController.text.isNotEmpty &&
                          _selectedImage != null) {
                        await context.read<AddAdsCubit>().addAd(
                            _textController.text, _selectedImage, cancelToken);
                      }
                    }
                  : null,
              text: S.of(context).confirm,
            ),
          ),
        )
      ],
    );
  }
}
