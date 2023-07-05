import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDataTable extends StatefulWidget {
  @override
  _FirebaseDataTableState createState() => _FirebaseDataTableState();
}

class _FirebaseDataTableState extends State<FirebaseDataTable> {
  final userEmail = FirebaseAuth.instance.currentUser?.email;

  Future<List<Map<String, dynamic>>> getDataFromCollections() async {
    CollectionReference collection1 =
        FirebaseFirestore.instance.collection('$userEmail');
    CollectionReference collection2 =
        FirebaseFirestore.instance.collection('users2');

    QuerySnapshot querySnapshot1 = await collection1.get();
    QuerySnapshot querySnapshot2 = await collection2.get();

    List<QueryDocumentSnapshot> documents1 = querySnapshot1.docs;
    List<QueryDocumentSnapshot> documents2 = querySnapshot2.docs;

    List<Map<String, dynamic>> dataList = [];

    for (var document in documents1) {
      dataList.add(document as Map<String, dynamic>);
    }

    for (var document in documents2) {
      dataList.add(document as Map<String, dynamic>);
    }

    return dataList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Data Table'),
      ),
      body: FutureBuilder(
        future: getDataFromCollections(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('Error: ${snapshot.error}')));
          }

          List<Map<String, dynamic>>? dataList = snapshot.data;

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: _buildColumns(dataList!),
              rows: _buildRows(dataList),
            ),
          );
        },
      ),
    );
  }

  List<DataColumn> _buildColumns(List<Map<String, dynamic>> dataList) {
    List<DataColumn> columns = [];

    if (dataList.isNotEmpty) {
      Map<String, dynamic> firstRow = dataList.first;

      firstRow.forEach((key, value) {
        columns.add(DataColumn(label: Text(key)));
      });
    }

    return columns;
  }

  List<DataRow> _buildRows(List<Map<String, dynamic>> dataList) {
    List<DataRow> rows = [];

    for (var data in dataList) {
      List<DataCell> cells = [];

      data.forEach((key, value) {
        cells.add(DataCell(Text('$value')));
      });

      rows.add(DataRow(cells: cells));
    }

    return rows;
  }
}
