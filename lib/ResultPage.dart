import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final Set<String> result;
  final String category;
  const ResultPage({Key key, this.result, this.category}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return new ResultPageState();
  }
}

class ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Result'),
        ),
        backgroundColor: Colors.green,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('allergy').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);
    print("*****" + widget.category);
    String item = widget.category.toLowerCase() == "dairy" ? record.dairy : record.nuts;
    bool found = false;
    Text noti;
    print("#####"+item);
    print(widget.result);
    if (widget.result.contains(item + ",")) {
      found = true;
    }
    // For debugging
    print(found);

    if (found) {
      noti = Text("$item is found! Not Safe!");
    } else {
      noti = Text("Nothing! Enjoy the meal!");
    }

    return Padding(
      key: ValueKey(record.dairy),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: noti,
        ),
      ),
    );
  }
}

class Record {
  final String dairy;
  final String nuts;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['dairy'] != null),
        assert(map['nuts'] != null),
        dairy = map['dairy'],
        nuts = map['nuts'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
