import 'package:flutter/material.dart';

class InputNamePage extends StatefulWidget {
  @override
  _InputNamePageState createState() => _InputNamePageState();
}

class _InputNamePageState extends State<InputNamePage> {
  final TextEditingController _nameController = TextEditingController();
  String _displayName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Masukkan Nama'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Masukkan Nama Anda',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _displayName = _nameController.text;
                });
              },
              child: Text('Tampilkan'),
            ),
            SizedBox(height: 20),
            Text(
              _displayName,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
