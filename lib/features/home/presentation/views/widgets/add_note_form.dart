import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/home/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/features/home/presentation/views/widgets/colors_list.dart';
import 'package:notes_app/core/widgets/custom_button.dart';
import 'package:notes_app/core/widgets/custom_text_field.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? title, content;
  AutovalidateMode v = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: v,
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            text: 'Title',
            saved: (p0) {
              title = p0;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            saved: (p0) {
              content = p0;
            },
            text: 'Content',
            maxLines: 3,
          ),
          const SizedBox(height: 24),
          const ColorsList(),
          const SizedBox(height: 24),
          BlocBuilder<AddNoteCubit, AddNoteCubitState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                tap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var note = NoteModel(
                        title: title!,
                        description: content!,
                        date: DateTime.now().year.toString(),
                        color: BlocProvider.of<AddNoteCubit>(context)
                            .color
                            .toARGB32());
                    BlocProvider.of<AddNoteCubit>(context).addNoteMethod(note);
                  } else {
                    v = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
