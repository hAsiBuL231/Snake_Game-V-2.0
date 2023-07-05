import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDataScreen extends StatefulWidget {
  @override
  _FirebaseDataScreenState createState() => _FirebaseDataScreenState();
}

class _FirebaseDataScreenState extends State<FirebaseDataScreen> {
  final userEmail = FirebaseAuth.instance.currentUser?.email;

  CollectionReference collection1 =
  FirebaseFirestore.instance.collection('users2');
  CollectionReference collection2 =
  FirebaseFirestore.instance.collection('users2');

  List<Map<String, dynamic>> dataList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    QuerySnapshot querySnapshot1 = await collection1.get();
    QuerySnapshot querySnapshot2 = await collection2.get();

    List<Map<String, dynamic>> tempDataList = [];

    querySnapshot1.docs.forEach((doc) {
      tempDataList.add(doc.data() as Map<String, dynamic>);
    });

    querySnapshot2.docs.forEach((doc) {
      tempDataList.add(doc.data() as Map<String, dynamic>);
    });

    setState(() {
      dataList = tempDataList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Data'),
      ),
      body: dataList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: <DataColumn>[
            DataColumn(label: Text('Field 1')),
            DataColumn(label: Text('Field 2')),
            // Add more columns as needed
          ],
          rows: dataList
              .map(
                (data) => DataRow(
              cells: <DataCell>[
                DataCell(Text(data['field1'].toString())),
                DataCell(Text(data['field2'].toString())),
                // Add more cells for each field
              ],
            ),
          )
              .toList(),
        ),
      ),
    );
  }
}
