import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gets/controller/notes_controller.dart';
import 'package:gets/routes/route_names.dart';
import 'package:gets/utils/colors.dart';
import 'package:intl/intl.dart';

class CustomNotes extends StatelessWidget {
  final int index;

  const CustomNotes({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotesController());
    final notes = controller.notes.elementAt(index);
    final createdTimeFormat = DateFormat.jm().format(notes.createdDate);
    final createdDateFormat = DateFormat.yMMMMd().format(notes.createdDate);
    return GestureDetector(
      onLongPress: () {
        Get.toNamed(RouteNames.notes_screen,
            arguments: {'isUpdate': true, 'note': notes});
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black.withOpacity(.2)),
        ),
        child: ListTile(
          horizontalTitleGap: 0,
          leading: Container(
            height: 15,
            width: 15,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor,
            ),
          ),
          title: Text(
            notes.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notes.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black.withOpacity(.5)),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '$createdDateFormat - $createdTimeFormat',
                style: TextStyle(
                    color: Colors.black.withOpacity(.5), fontSize: 11),
              ),
            ],
          ),
          trailing: GestureDetector(
            child: const Icon(Icons.delete),
            onTap: () {
              controller.deleteNotes(index);
            },
          ),
        ),
      ),
    );
  }
}
