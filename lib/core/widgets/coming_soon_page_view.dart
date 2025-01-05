import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';

class ComingSoonPageView extends StatelessWidget {
  const ComingSoonPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Coming Soon',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.orangeColor,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: Image.asset(
            ImagePath.imagesComingSoon,
            fit: BoxFit.contain,
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.5,
            errorBuilder: (context, error, stackTrace) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, size: 50, color: Colors.red),
                  SizedBox(height: 10),
                  Text(
                    'Image failed to load.',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
