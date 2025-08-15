import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/features/home/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/core/models/note_model.dart';
import 'package:notes_app/features/home/presentation/views/widgets/colors_list.dart';
import 'package:notes_app/core/widgets/custom_button.dart';
import 'package:notes_app/core/widgets/custom_text_field.dart';

class AddNoteSheetBody extends StatefulWidget {
  const AddNoteSheetBody({super.key});

  @override
  State<AddNoteSheetBody> createState() => _AddNoteSheetBodyState();
}

class _AddNoteSheetBodyState extends State<AddNoteSheetBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            saved: (p0) {
              title = p0;
            },
            hint: 'Title',
          ),
          const SizedBox(height: 16),
          CustomTextField(
            saved: (p0) {
              content = p0;
            },
            hint: 'Content',
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
                      date: DateFormat(
                        'yyyy/MM/dd  h:mm a',
                      ).format(DateTime.now()),
                      colors: BlocProvider.of<AddNoteCubit>(context).baseColors,
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNoteMethod(note);
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
