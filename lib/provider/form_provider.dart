import 'package:flutter/material.dart';

class FormProvider extends ChangeNotifier{
  

  TextEditingController titleNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}