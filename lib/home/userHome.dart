// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:su_project/config/config.dart';
// import 'package:su_project/home/BarCode/BarcodeScan.dart';
// import 'package:su_project/home/Posts/AllPosts.dart';

// import 'Authentication/login.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Services",
//           style: TextStyle(
//             fontSize: 30,
//             color: SU.backgroundColor,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               FirebaseAuth.instance.signOut().then((value) {
//                 Route route = MaterialPageRoute(builder: (_) => loginPage());
//                 Navigator.pushAndRemoveUntil(context, route, (route) => false);
//               });
//             },
//             icon: const Icon(
//               Icons.logout,
//             ),
//           )
//         ],
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Container(
//           margin: const EdgeInsets.all(10),
//           padding: const EdgeInsets.all(5),
//           child: Column(
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Next Class",
//                     style: TextStyle(
//                       color: SU.primaryColor,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(7),
//                       color: SU.backGroundContainerColor,
//                     ),
//                     width: MediaQuery.of(context).size.width,
//                     padding: const EdgeInsets.all(7),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "Wednesday, 8 Nov",
//                           style: TextStyle(
//                             color: SU.backgroundColor,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Column(
//                                   children: [
//                                     Text("11:00AM"),
//                                     Text(
//                                       "---to---",
//                                       style:
//                                           TextStyle(color: SU.backgroundColor),
//                                     ),
//                                     Text("12:30")
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                               ],
//                             ),
//                             Container(
//                               width: MediaQuery.of(context).size.width * 0.6,
//                               child: const Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     "ACCT-301-01 - Intermediate Accounting 1",
//                                     style: TextStyle(
//                                       color: SU.backgroundColor,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Icon(
//                                             Icons.map,
//                                             color: SU.primaryColor,
//                                             size: 11,
//                                           ),
//                                           Text(
//                                             "Building: 24",
//                                             style: TextStyle(
//                                               fontSize: 11,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Row(
//                                         children: [
//                                           Text(
//                                             "Room: ",
//                                             style: TextStyle(
//                                               fontSize: 11,
//                                             ),
//                                           ),
//                                           Text(
//                                             "174",
//                                             style: TextStyle(
//                                               fontSize: 11,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               Container(
//                   margin: const EdgeInsets.symmetric(
//                     vertical: 10,
//                   ),
//                   child: GridView.count(
//                     mainAxisSpacing: 6,
//                     crossAxisSpacing: 10,
//                     shrinkWrap: true,
//                     crossAxisCount: 2,
//                     childAspectRatio: 2 / 1.7, // Keeping your aspect ratio
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => const AllPosts(),
//                             ),
//                           );
//                         },
//                         child: Card(
//                           color: SU.backGroundContainerColor,
//                           child: Container(
//                             padding: const EdgeInsets.all(5),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   "images/3.png",
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.15,
//                                 ),
//                                 const Text(
//                                   "Post & Note",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     color: SU.primaryColor,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => BarcodeScanPage(),
//                             ),
//                           );
//                         },
//                         child: Card(
//                           color: SU.backGroundContainerColor,
//                           child: Container(
//                             padding: const EdgeInsets.all(5),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   "images/1.png",
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.15,
//                                 ),
//                                 const Text(
//                                   "Barcode",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     color: SU.primaryColor,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {},
//                         child: Card(
//                           color: SU.backGroundContainerColor,
//                           child: Container(
//                             padding: const EdgeInsets.all(5),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   "images/5.png",
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.15,
//                                 ),
//                                 const Text(
//                                   "Course \nEnrolled",
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     color: SU.primaryColor,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {},
//                         child: Card(
//                           color: SU.backGroundContainerColor,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 "images/2.png",
//                                 width:
//                                     MediaQuery.of(context).size.width * 0.165,
//                               ),
//                               const Text(
//                                 "Academic \nAdvisor",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   color: SU.primaryColor,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 17,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {},
//                         child: Card(
//                           color: SU.backGroundContainerColor,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 "images/6.png",
//                                 width:
//                                     MediaQuery.of(context).size.width * 0.165,
//                               ),
//                               const Text(
//                                 "Course \nResults",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   color: SU.primaryColor,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 17,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       GestureDetector(
//                         onTap: () {},
//                         child: Card(
//                           color: SU.backGroundContainerColor,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 "images/8.png",
//                                 width:
//                                     MediaQuery.of(context).size.width * 0.165,
//                               ),
//                               const Text(
//                                 "Academic \nRegsitration",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   color: SU.primaryColor,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 17,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:su_project/config/config.dart';
import 'package:su_project/home/BarCode/unity.dart';
import 'package:su_project/home/BarCode/BarcodeScan.dart';
import 'package:su_project/home/Posts/AllPosts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:su_project/home/AI/AI advising.dart';

import 'Authentication/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, String> userData = {};
// Assuming 'currentUser' is the document ID or some identifier for user document
  final String? currentUser = FirebaseAuth.instance.currentUser?.uid;

  // Initialize empty fields for user data
  final TextEditingController _collegeTextEditingController =
      TextEditingController();
  final TextEditingController _courseTextEditingController =
      TextEditingController();
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _studentIdTextEditingController =
      TextEditingController();
  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser)
        .get()
        .then((results) {
      if (results.exists) {
        setState(() {
          _collegeTextEditingController.text = results.get('College');
          _courseTextEditingController.text =
              results.data()!['course'] as String;
          _nameTextEditingController.text =
              results.data()!['fullName'] as String;
          _studentIdTextEditingController.text =
              results.data()!['studentID'] as String;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Services",
          style: TextStyle(
            fontSize: 30,
            color: SU.backgroundColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                Route route =
                    MaterialPageRoute(builder: (_) => const loginPage());
                Navigator.pushAndRemoveUntil(context, route, (route) => false);
              });
            },
            icon: const Icon(
              Icons.logout,
            ),
          )
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Text(
                //   "User Information",
                //   style: TextStyle(
                //     color: SU.primaryColor,
                //     fontWeight: FontWeight.bold,
                //   ),
                //   textAlign: TextAlign.left,
                // ),
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(7),
                //     color: SU.backGroundContainerColor,
                //   ),
                //   padding: EdgeInsets.all(10),
                //   margin: EdgeInsets.all(5),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       const SizedBox(height: 10),
                //       userInfoField('College', _collegeTextEditingController,
                //           Icons.school),
                //       userInfoField(
                //           'Course', _courseTextEditingController, Icons.book),
                //       userInfoField(
                //           'Name', _nameTextEditingController, Icons.person),
                //       userInfoField('Student ID',
                //           _studentIdTextEditingController, Icons.credit_card),
                //     ],
                //   ),
                // ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Next Class",
                      style: TextStyle(
                        color: SU.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: SU.backGroundContainerColor,
                      ),
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Wednesday, 8 Nov",
                            style: TextStyle(
                              color: SU.backgroundColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text("11:00AM"),
                                      Text(
                                        "---to---",
                                        style: TextStyle(
                                            color: SU.backgroundColor),
                                      ),
                                      Text("12:30")
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: const Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "ACCT-301-01 - Intermediate Accounting 1",
                                      style: TextStyle(
                                        color: SU.backgroundColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.map,
                                              color: SU.primaryColor,
                                              size: 11,
                                            ),
                                            Text(
                                              "Building: 24",
                                              style: TextStyle(
                                                fontSize: 11,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Room: ",
                                              style: TextStyle(
                                                fontSize: 11,
                                              ),
                                            ),
                                            Text(
                                              "174",
                                              style: TextStyle(
                                                fontSize: 11,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 10,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 1.7, // Keeping your aspect ratio
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const AllPosts(),
                              ),
                            );
                          },
                          child: Card(
                            color: SU.backGroundContainerColor,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "images/3.png",
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                  ),
                                  const Text(
                                    "Post & Note",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: SU.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Unity(),
                              ),
                            );
                          },
                          child: Card(
                            color: SU.backGroundContainerColor,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "images/1.png",
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                  ),
                                  const Text(
                                    "Barcode",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: SU.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            color: SU.backGroundContainerColor,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "images/5.png",
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                  ),
                                  const Text(
                                    "Course \nEnrolled",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: SU.primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => chat_page(),
                              ),
                            );
                          },
                          child: Card(
                            color: SU.backGroundContainerColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/2.png",
                                  width:
                                      MediaQuery.of(context).size.width * 0.165,
                                ),
                                const Text(
                                  "Academic \nAdvisor",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: SU.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            color: SU.backGroundContainerColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/6.png",
                                  width:
                                      MediaQuery.of(context).size.width * 0.165,
                                ),
                                const Text(
                                  "Course \nResults",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: SU.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            color: SU.backGroundContainerColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "images/8.png",
                                  width:
                                      MediaQuery.of(context).size.width * 0.165,
                                ),
                                const Text(
                                  "Academic \nRegsitration",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: SU.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget userInfoField(
      String label, TextEditingController controller, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: SU.primaryColor),
          const SizedBox(width: 10),
          Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
              child:
                  Text(controller.text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
