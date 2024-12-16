import 'package:client/core/theme/app_pallete.dart';
import 'package:client/core/widgets/custom_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadSongPage extends ConsumerStatefulWidget {
  const UploadSongPage({super.key});

  @override
  ConsumerState<UploadSongPage> createState() => _UploadSongPageState();
}

class _UploadSongPageState extends ConsumerState<UploadSongPage> {
  final songNAmeController = TextEditingController();
  final artistController = TextEditingController();
  Color selectedColor = Pallete.cardColor;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    songNAmeController.dispose();
    artistController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload song'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.check,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              DottedBorder(
                color: Pallete.borderColor,
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                strokeCap: StrokeCap.round,
                dashPattern: const [10, 4],
                child: const SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.folder_open,
                        size: 40,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'select the thumbnail for your song',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomField(
                hintText: 'Pick song',
                controller: null,
                readOnly: true,
                onTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              CustomField(hintText: 'Artist', controller: artistController),
              const SizedBox(
                height: 20,
              ),
              CustomField(
                  hintText: 'Song Name', controller: songNAmeController),
              const SizedBox(
                height: 20,
              ),
              ColorPicker(
                pickersEnabled: const {
                  ColorPickerType.wheel: true,
                },
                color: selectedColor,
                onColorChanged: (Color color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
