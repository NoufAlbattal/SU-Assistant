import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart' as DateFormatting;
import 'package:su_project/config/config.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController studentIDController = TextEditingController();
  String? college;
  String? level;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    User? user = SU.firebaseAuth!.currentUser;
    if (user != null) {
      DocumentSnapshot userData =
          await SU.firestore!.collection("users").doc(user.uid).get();
      if (userData.exists) {
        Map<String, dynamic> data = userData.data() as Map<String, dynamic>;
        fullNameController.text = data['fullName'] ?? '';
        emailController.text = data['email'] ?? '';
        addressController.text = data['address'] ?? '';
        courseController.text = data['course'] ?? '';
        studentIDController.text = data['studentID'] ?? '';
        college = data['College'];
        level = data['Level'];
        setState(() {}); // Refresh the UI with the fetched data
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 200,
                  child: Image.asset("images/logo.jpg"),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      displayTextField("Full Name", fullNameController),
                      displayTextField("Email", emailController),
                      displayTextField("Address", addressController),
                      displayTextField("Course", courseController),
                      displayTextField("Student ID", studentIDController),
                      displayDetail("College", college ?? "Not set"),
                      displayDetail("Level", level ?? "Not set"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget displayTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: SU.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.info,
              color: SU.primaryColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: SU.backgroundColor, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          readOnly: true,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget displayDetail(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: SU.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: SU.primaryColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(value),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
