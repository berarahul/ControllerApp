import 'package:controller/view/Screens/pendingRequestCard/pendingTeacherList.dart';
import 'package:controller/view/Screens/pendingRequestCard/widgets/Remove%20Teacher%20Department.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../constant/AppColors.dart';
import '../../../viewmodel/services/PendingRequestServices/TeacherMangementController.dart';
import '../../../viewmodel/services/PendingRequestServices/pendiingTeacherListController.dart';
import '../AddTeacherToDepartment/AddTeacherToDepartmentScreen.dart';

class TeacherControllerActionsScreen extends StatelessWidget {
  final Teachermangementcontroller controller =
      Get.put(Teachermangementcontroller());
  final TeacherController teacherController = Get.put(TeacherController());
  TeacherControllerActionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Add this line

      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: _buildBackgroundDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40.0, bottom: 20.0),
              child: Text(
                'Teacher Management',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.actions.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          _handleAction(context, controller.actions[index]);
                        },
                        child: DepartmentActionWidget(
                          actionText: controller.actions[index],
                          index: index,
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBackgroundDecoration() {
    final hour = DateTime.now().hour;
    List<Color> gradientColors = [];

    if (hour >= 6 && hour < 12) {
      // Morning gradient
      gradientColors = [Colors.yellow, Colors.lightBlueAccent];
    } else if (hour >= 12 && hour < 17) {
      // Afternoon gradient
      gradientColors = [Colors.blue, Colors.lightBlue];
    } else if (hour >= 17 && hour < 22) {
      gradientColors = [AppColors.softRed, AppColors.peach];
    } else {
      // Evening gradient
      gradientColors = [Colors.indigo, Colors.black];
    }

    return BoxDecoration(
      gradient: LinearGradient(
        colors: gradientColors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }

  void _handleAction(BuildContext context, String action) {
    if (action == 'Pending Teacher Request') {
      controller.pendingTeacherRequest();
      teacherController.fetchTeachers();
      _showAddDepartmentModal(context);
    } else if (action == 'Remove Teacher From Department') {
      controller.RemoveTeacherDepartment();
      _showDeleteDepartmentModal(context);
    } else if (action == 'Add Teacher To Department') {
      controller.AddTeacherDepartment();
      _showAddingDepartmentModal(context);
    }
  }

  void _showAddDepartmentModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: TeacherListScreen(),
      ),
    );
  }

  void _showDeleteDepartmentModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: RemoveTeacherDepartment(),
      ),
    );
  }

  void _showAddingDepartmentModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: AddTeacherToDepartmentScreen(),
      ),
    );
  }



}

class DepartmentActionWidget extends StatelessWidget {
  final String actionText;
  final int index;

  const DepartmentActionWidget({
    Key? key,
    required this.actionText,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hour = DateTime.now().hour;
    List<Color> cardColors = [];
    if (hour >= 6 && hour < 12) {
      // Morning gradient
      cardColors = [Colors.yellow, Colors.lightBlueAccent];
    } else if (hour >= 12 && hour < 17) {
      // Afternoon gradient
      cardColors = [Colors.orangeAccent, Colors.yellowAccent];
    } else if (hour >= 17 && hour < 22) {
      cardColors = [AppColors.softRed, AppColors.peach];
    } else {
      // Evening gradient
      cardColors = [Colors.indigo, Colors.black];
    }

    return Card(
      color: Colors.white.withOpacity(0.3), // Semi-transparent white
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: cardColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                actionText,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              _buildIconForAction(actionText),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconForAction(String actionText) {
    IconData iconData;
    switch (actionText) {
      case 'Pending Teacher Request':
        iconData = Icons.error_outline_outlined;
        break;
      case 'Remove Teacher From Department':
        iconData = Icons.remove;
        break;
      case 'Add Teacher To Department':
        iconData = Icons.add;
        break;

      default:
        iconData = Icons.error_outline;
    }
    return Icon(iconData);
  }
}
