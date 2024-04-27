import 'package:flutter/material.dart';

import '../../../../core/utils/validation.dart';
import '../../../../core/widgets/custom_text_field.dart';

class EditProfileDetails extends StatelessWidget {
  const EditProfileDetails(
      {super.key,
        required this.fullNameController,
        required this.phoneController,
        required this.bioController});

  final TextEditingController fullNameController,
      phoneController,
      bioController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            CustomTextField(
              controller: fullNameController,
              borderRadius: 20,
              enabled: true,
              borderColor: Colors.grey,
              labelText: 'Full Name',
              validator: (value) => Validation.requiredValidator(value),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: bioController,
              borderRadius: 20,
              enabled: true,
              borderColor: Colors.grey,
              labelText: 'Bio',
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: phoneController,
              labelText: 'phone',
              textInputType: TextInputType.phone,
              borderColor: Colors.grey,
              borderRadius: 20,
              validator: (value) => Validation.requiredValidator(value),
            ),
          ],
        ),
      ),
    );
  }
}
