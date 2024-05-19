import 'package:flutter/material.dart';

class RoomsLists extends StatefulWidget {
  @override
  _RoomsLists createState() => _RoomsLists();
}

class _RoomsLists extends State<RoomsLists> {
  String? selectedRoom;
  List<String> rooms = [
    'Agentis Room',
    'Administrative Communication Room',
    'First Entrance Room',
    'Second Entrance Room',
    'Administrative And Financial Affairs Room',
    'Library Room',
    'Physics Laboratory Room',
    'Female student Affairs Office Room 1',
    'Female student Affairs Office Room 2',
    'Cafeteria Room',
    'Theater Room',
    'University Security Room',
    'Computer Lap Room 1',
    'Computer Lap Room 2',
    'Archive Room',
    'Room 107',
    'Biology Laboratory Room',
    'Chemistry Laboratory Room',
    'Room',
    'Personnel Office Room',

  ];
  List<String> filteredRooms = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredRooms = rooms; // Initially display all rooms
    searchController.addListener(() {
      filterRooms();
    });
  }

  void filterRooms() {
    List<String> _temp = [];
    _temp.addAll(rooms.where((room) =>
        room.toLowerCase().contains(searchController.text.toLowerCase())));
    setState(() {
      filteredRooms = _temp;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Room'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search for a room',
                hintText: 'Enter room number',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(),
                ),
                filled: true,
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
          ),
// 'Expanded' widget يجعل العنصر الداخلي يأخذ المساحة المتاحة في العمود أو الصف.
          Expanded(
            // 'child' هنا يحدد العنصر الفرعي لـ Expanded والذي سيتوسع ليشغل المساحة.
            child: ListView.builder(
              // 'itemCount' يحدد عدد العناصر التي ستظهر في القائمة.
              itemCount: filteredRooms.length,
              // 'itemBuilder' هو الدالة التي تبني وتعيد كل عنصر داخل القائمة.
              itemBuilder: (context, index) {
                // 'Card' widget يستخدم لإنشاء بطاقة تحتوي على محتويات.
                return Card(
                  // 'margin' يحدد الهوامش حول البطاقة لتبقى مسافة بينها وبين العناصر الأخرى.
                  margin:
                  const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  // 'child' هنا يحدد محتوى البطاقة وهو 'ListTile'.
                  child: ListTile(
                    // 'title' يحدد النص الرئيسي داخل 'ListTile'.
                    title: Text(filteredRooms[index]),
                    // 'onTap' هو الحدث الذي يحدث عند النقر على العنصر.
                    onTap: () {
                      // 'setState' تستخدم لتغيير حالة التطبيق وإعادة بناء الواجهة بمعلومات جديدة.
                      setState(() {
                        // تحديد الغرفة المختارة بناءً على العنصر الذي تم النقر عليه.
                        selectedRoom = filteredRooms[index];
                        // طباعة الغرفة المختارة في منفذ التصحيح (console).
                        print(selectedRoom);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}