import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/values.dart';
import '../models/task.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  bool isButtonEnabled = false;

  void saveTask() {
    if (!formKey.currentState!.validate()) return;

    final task = Task(
      title: titleController.text.trim(),
      description: descriptionController.text.trim(),
      createdAt: DateTime.now(),
    );
    Navigator.pop(context, task);
  }

  void validateForm() {
  setState(() {
    isButtonEnabled =
        titleController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty;
  });
}

@override
void initState() {
  super.initState();

  titleController.addListener(validateForm);
  descriptionController.addListener(validateForm);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: CustomColors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: CustomColors.primary,
        ),
        title: Text(
          'Nova Tarefa',
          style: TextStyle(
            color: CustomColors.primary,
            fontSize: Values.fontSize.large!,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Values.spacing.mediumLarge!,
            vertical: Values.spacing.mediumLarge!,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(
                child: Text(
                  'Crie uma nova tarefa preenchendo os campos abaixo:',
                  style: TextStyle(
                    fontSize: Values.fontSize.small,
                    color: CustomColors.fontSecondary,
                  ),
                ),
              ),

              SizedBox(height: Values.spacing.large),

              Container(
                decoration: BoxDecoration(
                  color: CustomColors.cardBackground,
                  borderRadius: BorderRadius.circular(Values.radius.medium!),
                ),
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [

                      TextFormField(
                        controller: titleController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Título',
                          hintText: 'Informe o título de sua tarefa',
                          labelStyle: TextStyle(
                            fontSize: Values.fontSize.small!,
                            color: CustomColors.primary,
                            fontWeight: FontWeight.w800,
                          ),
                          hintStyle: TextStyle(
                            fontSize: Values.fontSize.small!,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Values.radius.medium!),
                            borderSide: BorderSide(color: CustomColors.primaryBorder),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Values.radius.medium!),
                            borderSide: BorderSide(color: CustomColors.primaryBorder),
                           ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Informe um título';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: Values.spacing.medium),

                      TextFormField(
                        controller: descriptionController,
                        maxLines: 4,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                          labelText: 'Descrição',
                          hintText: 'Informe a descrição de sua tarefa',
                          labelStyle: TextStyle(
                            fontSize: Values.fontSize.small!,
                            color: CustomColors.primary,
                            fontWeight: FontWeight.w800,
                          ),
                          hintStyle: TextStyle(
                            fontSize: Values.fontSize.small!,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Values.radius.medium!),
                            borderSide: BorderSide(color: CustomColors.primaryBorder),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Values.radius.medium!),
                            borderSide: BorderSide(color: CustomColors.primaryBorder),
                          ),
                          alignLabelWithHint: true,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Informe uma descrição';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: Values.spacing.large!),

              Row(
                children: [
          
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: CustomColors.primary),
                      ),
                      child: Text('Cancelar',
                      style: TextStyle(
                         color: CustomColors.primary,
                         fontSize: Values.fontSize.small!,
                        fontWeight: FontWeight.w900,
                        ),  
                      ),
                    ),
                  ),

                  SizedBox(width: Values.spacing.small!),

                  Expanded(
                    child: ElevatedButton(
                    onPressed: isButtonEnabled
                      ? () {
                          if (formKey.currentState!.validate()) {
                            saveTask();
                          }
                        }
                      : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.primary,
                        disabledBackgroundColor: CustomColors.buttonDisabled,
                      ),
                      child: Text(
                        'Salvar', 
                         style: TextStyle(
                         color: CustomColors.white,
                         fontSize: Values.fontSize.small!,
                        fontWeight: FontWeight.w900,
                        ),  
                      ),
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
}