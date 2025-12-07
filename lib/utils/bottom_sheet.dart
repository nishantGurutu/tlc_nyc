import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tlc_nyc/controller/add_question_controller.dart';
import 'package:tlc_nyc/controller/login_controller.dart';
import 'package:tlc_nyc/utils/image_picker_class.dart';

class BottomSheetClass {
  void showImagePickerSheet(BuildContext context, String from) {
    Get.bottomSheet(
      SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Select Image",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      selectImage(ImageSource.gallery, from);
                      Get.back();
                    },
                    child: Row(
                      children: [
                        Text("Gallery", style: TextStyle(color: Colors.black)),
                        const SizedBox(width: 10),
                        Icon(Icons.file_copy, color: Colors.black),
                      ],
                    ),
                  ),
                  const SizedBox(width: 40),
                  InkWell(
                    onTap: () {
                      selectImage(ImageSource.camera, from);
                      Get.back();
                    },
                    child: Row(
                      children: [
                        Text("Camera", style: TextStyle(color: Colors.black)),
                        const SizedBox(width: 10),
                        Icon(Icons.camera_alt, color: Colors.black),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> selectImage(ImageSource source, String from) async {
    final File? file = await ImagePickerHelper.pickImage(source);

    if (file != null) {
      if (from == "register") {
        final LoginController loginController = Get.find<LoginController>();
        loginController.pickedFile.value = file;
        loginController.selectedImagePath.value = file.path;
      } else if (from == "question_type") {
        final AddQuestionController addQuestionController =
            Get.find<AddQuestionController>();
        addQuestionController.pickedFile.value = file;
      }
    }
  }
}
