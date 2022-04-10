import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku_flutter/domain/controllers/pages/sudoku_page_controller.dart';

class SpeccialButtons extends StatelessWidget {
  const SpeccialButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SudokuPageController controller = Get.find();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Obx(() {
          Color color =
              controller.isAnnotationMode.value ? Colors.blue : Colors.black;
          return ListTile(
            leading: Icon(Icons.dashboard_customize_outlined, color: color),
            title: Text("Annotation Mode", style: TextStyle(color: color)),
            onTap: controller.switchAnnotations,
          );
        }),
        ListTile(
          leading: const Icon(Icons.help_outline_outlined, color: Colors.black),
          title: const Text("Hint", style: TextStyle(color: Colors.black)),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.backspace_sharp, color: Colors.black),
          title: const Text("Delete cell data",
              style: TextStyle(color: Colors.black)),
          onTap: controller.deleteSelectedValue,
        ),
      ],
    );
  }
}
