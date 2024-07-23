import 'package:flutter/material.dart';

class DisplayScreen extends StatelessWidget {
  final String name;
  final String age;
  final String contactNumber;
  final String emergencyNumber;

  DisplayScreen({
    required this.name,
    required this.age,
    required this.contactNumber,
    required this.emergencyNumber,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Info'),
        backgroundColor: Color(0xFF264653),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDarkMode
                ? [Colors.black87, Colors.black54]
                : [Color.fromARGB(255, 249, 250, 250), Color.fromARGB(255, 249, 250, 250)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Card(
                      color: isDarkMode ? Colors.grey[850] : Colors.white,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0).copyWith(top: 40.0), // Adjust padding to make space for CircleAvatar
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 60), // Space between the CircleAvatar and the container content
                            buildInfoRow(
                              icon: Icons.person,
                              label: 'Name',
                              value: name,
                              isDarkMode: isDarkMode,
                            ),
                            SizedBox(height: 10),
                            buildInfoRow(
                              icon: Icons.cake,
                              label: 'Age',
                              value: age,
                              isDarkMode: isDarkMode,
                            ),
                            SizedBox(height: 10),
                            buildInfoRow(
                              icon: Icons.phone,
                              label: 'Contact Number',
                              value: contactNumber,
                              isDarkMode: isDarkMode,
                            ),
                            SizedBox(height: 10),
                            buildInfoRow(
                              icon: Icons.phone_in_talk,
                              label: 'Emergency Number',
                              value: emergencyNumber,
                              isDarkMode: isDarkMode,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: -40, // Adjust position to move CircleAvatar up
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/images/profile_picture.jpg'), // Replace with your image path
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    required bool isDarkMode,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Color(0xFF264653)),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$label:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: isDarkMode ? Colors.white70 : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
