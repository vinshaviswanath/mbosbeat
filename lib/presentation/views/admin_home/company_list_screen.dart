import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/local_db/app_db.dart';

class CompanyListScreen extends StatelessWidget {
  const CompanyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final db = context.read<AppDb>();

    return Scaffold(
      appBar: AppBar(title: const Text("Companies")),

      body: StreamBuilder<List<Company>>(
        stream: db.companyDao.watchAllCompanies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final data = snapshot.data ?? [];

          if (data.isEmpty) {
            return const Center(child: Text("No companies found."));
          }

          return Scrollbar(
            thumbVisibility: true,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // ⬅ Horizontal
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 900,
                ), // Adjust width as needed
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical, // ⬅ Vertical
                  child: DataTable(
                    headingRowColor: WidgetStateProperty.all(
                      Colors.grey.shade300,
                    ),
                    border: TableBorder.all(color: Colors.grey.shade400),

                    columns: const [
                      DataColumn(label: Text("ID")),
                      DataColumn(label: Text("Company Name")),
                      DataColumn(label: Text("Code")),
                      DataColumn(label: Text("Mobile")),
                      DataColumn(label: Text("Email")),
                      DataColumn(label: Text("Country")),
                      DataColumn(label: Text("State")),
                      DataColumn(label: Text("Created On")),
                    ],

                    rows: data.map((c) {
                      return DataRow(
                        cells: [
                          DataCell(Text(c.id.toString())),
                          DataCell(Text(c.companyName ?? "")),
                          DataCell(Text(c.companyCode ?? "")),
                          DataCell(Text(c.mobile ?? "")),
                          DataCell(Text(c.email ?? "")),
                          DataCell(Text(c.country ?? "")),
                          DataCell(Text(c.state ?? "")),
                          DataCell(Text(c.createdOn?.toIso8601String() ?? "")),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
