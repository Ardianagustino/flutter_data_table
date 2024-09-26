// File: lib/pages/datatable.dart

// File: lib/pages/datatable.dart

import 'package:flutter/material.dart';
import '../datasource/city_data.dart'; // Untuk data kota
import '../models/city.dart'; // Untuk mengimpor kelas City


class MyDatatable extends StatefulWidget {
  const MyDatatable({super.key});

  @override
  State<MyDatatable> createState() => _MyDatatableState();
}

class _MyDatatableState extends State<MyDatatable> {
  // List to store selected rows
  final List<City> _selectedCities = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Kota di Indonesia'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Pilih',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Nama Kota',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Provinsi',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Jumlah Penduduk',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: cities.map((city) {
            final isSelected = _selectedCities.contains(city);
            return DataRow(
              selected: isSelected,
              onSelectChanged: (bool? selected) {
                setState(() {
                  if (selected == true) {
                    _selectedCities.add(city);
                  } else {
                    _selectedCities.remove(city);
                  }
                });
              },
              cells: <DataCell>[
                DataCell(
                  Checkbox(
                    value: isSelected,
                    onChanged: (bool? selected) {
                      setState(() {
                        if (selected == true) {
                          _selectedCities.add(city);
                        } else {
                          _selectedCities.remove(city);
                        }
                      });
                    },
                  ),
                ),
                DataCell(Text(city.name)),
                DataCell(Text(city.province)),
                DataCell(Text(city.population)),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
