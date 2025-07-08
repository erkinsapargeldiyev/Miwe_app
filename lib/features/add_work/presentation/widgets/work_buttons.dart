import 'package:flutter/material.dart';
import 'package:miwe/features/add_work/presentation/widgets/todo_work_button.dart';

class WorkButtons extends StatefulWidget {
  const WorkButtons({super.key});

  @override
  State<WorkButtons> createState() => _WorkButtonsState();
}

class _WorkButtonsState extends State<WorkButtons> {
  int selectedButton = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          bool tasks = selectedButton == index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TodoWorkButton(
              onTap: () {
                setState(() {
                  selectedButton = index;
                });
              },
              title:
                  index == 0
                      ? 'Edilmeli işler'
                      : index == 1
                      ? 'Tamalanan işler'
                      : 'Wagtynda iamamlanmadyk işler',
              todoTasks: tasks,
            ),
          );
        },
      ),
    );
  }
}
