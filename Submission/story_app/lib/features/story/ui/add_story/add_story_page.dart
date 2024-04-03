import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:story_app/common/constants.dart';
import 'package:story_app/features/story/provider/story_provider.dart';
import 'package:story_app/flavors/flavors.dart';
import 'package:story_app/localization/localization.dart';
import 'package:story_app/utils/compress_image.dart';
import 'package:story_app/utils/show_snackbar.dart';

class AddStoryPage extends StatefulWidget {
  const AddStoryPage({super.key});

  @override
  State<AddStoryPage> createState() => _AddStoryPageState();
}

class _AddStoryPageState extends State<AddStoryPage> {
  late StoryProvider storyProvider;
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var text = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storyProvider = context.read<StoryProvider>();
    // storyProvider.addListener(_listenUploadState);
  }

  // listenUploadState() {
  //   storyProvider.uploadState.maybeWhen(
  //     success: (value) {
  //       storyProvider.setImageFile(null);
  //       storyProvider.setImagePath(null);
  //       // showSnackbar(context, "UploadSuccess");
  //       // if (mounted) context.goNamed(Routes.root);
  //       if (mounted) {
  //         showSnackbar(context, "Upload Success");
  //         context.goNamed(Routes.root);
  //         // Future.delayed(Duration(milliseconds: 500), () {
  //         //   context.goNamed(Routes.root);
  //         // });
  //       }
  //     },
  //     error: (value) {
  //       if (mounted) {
  //         showSnackbar(context, value);
  //         // storyProvider.setImageFile(null);
  //         storyProvider.setImagePath(null);
  //         context.goNamed(Routes.root);
  //       }
  //     }, orElse: () => showSnackbar(context, "Meong"),
  //   );
  //
  //   // if (storyProvider.uploadState == UploadState.success) {
  //   //
  //   // } else if (storyProvider.uploadState == UploadState.error) {
  //   //
  //   // }
  // }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final content = AppLocalizations.of(context)!;

    final state = storyProvider.uploadState;
    final stateLocation = storyProvider.latLng;
    final address = stateLocation != null ? storyProvider.locationName : "";
    final isLoading =
        state.maybeWhen(loading: (value) => value, orElse: () => false);

    return Scaffold(
      appBar: AppBar(
        title: Text(content.titleAppBarAdd),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AnimatedOpacity(
            opacity:
                text.isNotEmpty && storyProvider.imagePath != null ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: text.isNotEmpty && storyProvider.imagePath != null
                ? FloatingActionButton(
                    onPressed: () {
                      _onUpload(text, storyProvider);
                    },
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : const Icon(Icons.upload),
                  )
                : null,
          ),
          const SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            onPressed: () {
              if (F.appFlavor == Flavor.paid) {
                context.goNamed(Routes.addLocation);
              } else {
                showSnackbar(context, "Only Paid Version");
              }
            },
            child: const Icon(Icons.my_location),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
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
                      border: const OutlineInputBorder(),
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
                      onPressed: () => _onGallery(storyProvider),
                      child: Text(content.btnGallery),
                    ),
                    ElevatedButton(
                      onPressed: () => _onCamera(storyProvider),
                      child: Text(content.btnCamera),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "${content.textLocation}: $address",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onGallery(StoryProvider provider) async {
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

  void _onCamera(StoryProvider provider) async {
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

  void _onUpload(String description, StoryProvider provider) async {
    final imagePath = provider.imagePath;
    final imageFile = provider.imageFile;

    if (imagePath == null || imageFile == null) return;

    final fileName = imageFile.name;
    final bytes = await imageFile.readAsBytes();
    final newBytes = await compressImage(bytes);

    await provider
        .uploadStory(
          newBytes,
          fileName,
          description,
        )
        .then(
          (value) => value.maybeWhen(
            success: (value) {
              provider.setImageFile(null);
              provider.setImagePath(null);
              if (mounted) {
                storyProvider.fetchStories(true);
                showSnackbar(context, value);
                context.goNamed(Routes.root);
              }
            },
            error: (value) {
              if (mounted) showSnackbar(context, value);
            },
            orElse: () => null,
          ),
        );

    // final error =
    //     state.maybeWhen(error: (value) => value, orElse: () => "null");

    // state.maybeWhen(
    //   success: (value) {
    //     provider.setImageFile(null);
    //     provider.setImagePath(null);
    //     if (mounted) {
    //       context.read<StoryProvider>().fetchStories(true);
    //       showSnackbar(context, value);
    //       context.goNamed(Routes.root);
    //     }
    //   },
    //   error: (value) {
    //     if (mounted) showSnackbar(context, value);
    //   },
    //   orElse: () => null,
    // );

    // if ((provider.uploadState == const UploadState.success())) {
    //   provider.setImageFile(null);
    //   provider.setImagePath(null);
    //   if (mounted) {
    //     context.read<StoryProvider>().fetchStories(true);
    //     showSnackbar(context, "Upload Success");
    //     context.goNamed(Routes.root);
    //   }
    // } else {
    //   if (mounted) showSnackbar(context, error);
    // }
    // state.maybeWhen(
    //     // loading: (value) {
    //     //   if (!value.isLoading) {
    //     //     provider.setImageFile(null);
    //     //     provider.setImagePath(null);
    //     //   }
    //     // },
    //     success: (value) {
    //       provider.setImageFile(null);
    //       provider.setImagePath(null);
    //       if (mounted) {
    //         context.read<StoryProvider>().fetchStories();
    //         showSnackbar(context, value);
    //         context.goNamed(Routes.root);
    //       }
    //     },
    //     orElse: () => null);

    // state.whenOrNull(success: (value) {
    //
    // });

    // if (state) {
    //   provider.setImageFile(null);
    //   provider.setImagePath(null);
    //   if (mounted) {
    //     context.read<StoryProvider>().fetchStories();
    //     showSnackbar(context, provider.message);
    //     context.goNamed(Routes.root);
    //   }
    // }
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
