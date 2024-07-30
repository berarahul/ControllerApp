
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constant/AppColors.dart';
import '../../../constant/routes/approutes.dart';
import '../../../viewmodel/services/LoginService/AuthServices.dart';


class Controllerscreen extends StatelessWidget {
  final List<String> buttonNames = ['Teacher Controller', 'Department','Change HOD','Holiday'];
  final List<String> iconPaths = [
    'assets/images/pending_request.png', // replace with your student icon path
    // replace with your teacher icon path
    'assets/images/department.png',

    'assets/images/hod.png', // replace with your subject icon path
    'assets/images/holiday.png', // replace with your subject icon path
    // 'assets/images/Routine.png'  // replace with your Routine icon path
  ];

  Controllerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = Get.put(AuthService());
    final DateTime now = DateTime.now();
    final String greeting;
    final List<Color> gradientColors;

    if (now.hour >= 6 && now.hour < 12) {
      greeting = 'Good Morning';
      gradientColors = [Colors.yellow, Colors.lightBlueAccent];
    } else if (now.hour >= 12 && now.hour < 17) {
      greeting = 'Good Afternoon';
      gradientColors = [Colors.orangeAccent, Colors.yellowAccent];
    } else if (now.hour >= 17 && now.hour < 22) {
      greeting = 'Good Evening';
      gradientColors = [AppColors.softRed, AppColors.peach];
    } else {
      greeting = 'Good Night';
      gradientColors = [Colors.indigo, Colors.black];
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        greeting,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: List.generate(buttonNames.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: AdminCard(
                                    title: buttonNames[index],
                                    iconPath: iconPaths[index],
                                    onTap: () {
                                      if (buttonNames[index] == 'Teacher Controller') {
                                        Get.toNamed(AppRoutes.Pendingrequest);
                                      }
                                      else if (buttonNames[index] == 'Department') {
                                        Get.toNamed(AppRoutes.Department);
                                      }
                                      else if (buttonNames[index] == 'Change HOD') {
                                        Get.toNamed(AppRoutes.HOD);
                                      }
                                      else if (buttonNames[index] == 'Holiday') {
                                        Get.toNamed(AppRoutes.holiday);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Logout'),
              content: const Text('Are you sure you want to log out?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back(); // Close the dialog
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    authService.logout();
                    Get.offAllNamed('/login');
                  },
                  child: const Text('Logout'),
                ),
              ],
            ),
          );
        },
        backgroundColor: AppColors.appcolor,
        tooltip: 'Logout',
        child: const Icon(Icons.logout),
      ),
    );
  }
}

class AdminCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onTap;

  const AdminCard({super.key, required this.title, required this.iconPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shadowColor: Colors.black,
        color: AppColors.appcolor,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              IconCard(iconPath: iconPath),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconCard extends StatelessWidget {
  final String iconPath;

  const IconCard({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(
        iconPath,
        width: 50,
        height: 50,
      ),
    );
  }
}
