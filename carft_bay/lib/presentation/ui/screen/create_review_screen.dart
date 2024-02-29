// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carft_bay/presentation/ui/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carft_bay/presentation/state_holders/create_review_controller.dart';

class CreateReviewScreen extends StatefulWidget {
  final int productsId;
  final double rating;

  const CreateReviewScreen({
    Key? key,
    required this.productsId,
    required this.rating,
  }) : super(key: key);

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _reviewTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Create Review", true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _firstNameTEController,
                  validator: (String? text) {
                    if (text?.isEmpty ?? true) {
                      return "Enter first name";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "First Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  validator: (String? text) {
                    if (text?.isEmpty ?? true) {
                      return "Enter last name";
                    }
                    return null;
                  },
                  controller: _lastNameTEController,
                  decoration: const InputDecoration(
                    hintText: "Last Name",
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  validator: (String? text) {
                    if (text?.isEmpty ?? true) {
                      return "Review field cannot be empty";
                    }
                    return null;
                  },
                  controller: _reviewTEController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    hintText: "Write Reviews",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<CreateReviewController>(
                    builder: (controller) {
                      if (controller.createReviewInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller
                                .createReview(
                              _reviewTEController.text.trim(),
                              widget.productsId,
                              widget.rating,
                            )
                                .then(
                              (result) {
                                if (result) {
                                  _firstNameTEController.clear();
                                  _lastNameTEController.clear();
                                  _reviewTEController.clear();
                                  Get.snackbar('done', "review added done");
                                }
                              },
                            );
                          }
                        },
                        child: const Text("Submit"),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
