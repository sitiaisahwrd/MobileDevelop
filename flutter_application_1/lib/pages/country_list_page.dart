import 'package:flutter/material.dart';

class CountryListPage extends StatelessWidget {
  final List<String> countries = [
    'Uganda',
    'Mesir',
    'Chile',
    'Argentina',
    'Belanda',
    'Inggris',
    'Italia',
    'Singapore',
    'Malaysia',
    'Indonesia'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi List View'),
      ),
      body: ListView.builder(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(countries[index]),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Anda memilih ${countries[index]}')),
              );
            },
          );
        },
      ),
    );
  }
}
