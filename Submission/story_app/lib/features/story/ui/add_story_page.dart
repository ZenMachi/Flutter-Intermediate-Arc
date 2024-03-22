import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:story_app/common/constants.dart';
import 'package:story_app/features/story/provider/story_provider.dart';
import 'package:story_app/localization/localization.dart';
import 'package:story_app/utils/show_snackbar.dart';

class AddStoryPage extends StatefulWidget {
  const AddStoryPage({super.key});

  @override
  State<AddStoryPage> createState() => _AddStoryPageState();
}

class _AddStoryPageState extends State<AddStoryPage> {
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var text = '';

  @override
  Widget build(BuildContext context) {
    final content = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(content.titleAppBarAdd),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: text.isNotEmpty
          ? FloatingActionButton(
              onPressed: () => _onUpload(text),
              child: context.watch<StoryProvider>().isLoading
                  ? const CircularProgressIndicator()
                  : const Icon(Icons.upload),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                width: 100.w,
                height: 40.h,
                child: context.watch<StoryProvider>().imagePath == null
                    ? const Center(
                        child: Icon(
                          Icons.image_rounded,
                          size: 128,
                        ),
                      )
                    : _showImage()),
            const SizedBox(height: 8),
            SizedBox(
              width: 80.w,
              child: TextField(
                controller: controller,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: content.labelTextDesc,
                ),
                onChanged: (value) {
                  setState(() {
                    text = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton(
                  onPressed: _onGallery,
                  child: Text(content.btnGallery),
                ),
                ElevatedButton(
                  onPressed: _onCamera,
                  child: Text(content.btnCamera),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void _onGallery() async {
    final provider = context.read<StoryProvider>();
    final ImagePicker picker = ImagePicker();

    final isMacOS = defaultTargetPlatform == TargetPlatform.macOS;
    final isLinux = defaultTargetPlatform == TargetPlatform.linux;

    if (isMacOS || isLinux) return;

    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      provider.setImageFile(pickedFile);
      provider.setImagePath(pickedFile.path);
    }
  }

  void _onCamera() async {
    final provider = context.read<StoryProvider>();
    final ImagePicker picker = ImagePicker();

    final isAndroid = defaultTargetPlatform == TargetPlatform.android;
    final isiOS = defaultTargetPlatform == TargetPlatform.iOS;
    final isNotMobile = !(isAndroid || isiOS);
    if (isNotMobile) return;

    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      provider.setImageFile(pickedFile);
      provider.setImagePath(pickedFile.path);
    }
  }

  void _onUpload(String description) async {
    final provider = context.read<StoryProvider>();
    final imagePath = provider.imagePath;
    final imageFile = provider.imageFile;

    if (imagePath == null || imageFile == null) return;

    final fileName = imageFile.name;
    final bytes = await imageFile.readAsBytes();
    final newBytes = await provider.compressImage(bytes);

    await provider.uploadStory(
      newBytes,
      fileName,
      description,
    );

    if (provider.uploadResult != null) {
      provider.setImageFile(null);
      provider.setImagePath(null);
      if (mounted) {
        context.read<StoryProvider>().fetchStories();
        showSnackbar(context, provider.message);
        context.goNamed(Routes.root);
      }
    }
  }

  Widget _showImage() {
    final imagePath = context.read<StoryProvider>().imagePath;
    return kIsWeb
        ? Image.network(
            imagePath.toString(),
            fit: BoxFit.contain,
          )
        : Image.file(
            File(imagePath.toString()),
            fit: BoxFit.contain,
          );
  }
}
