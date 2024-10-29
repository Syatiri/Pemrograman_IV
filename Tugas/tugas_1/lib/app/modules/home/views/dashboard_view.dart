import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_1/app/modules/home/views/add_sale_view.dart';
import '../controllers/sales_controller.dart';
import 'package:intl/intl.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final SalesController salesController = Get.put(SalesController());
    final currencyFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Penjualan'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              // Berpindah ke halaman form tambah penjualan
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddSaleView(),
                ),
              );
            },
          ),
        ],
      ),
      body: Obx(
        () => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('No Faktur')),
                  DataColumn(label: Text('Tanggal')),
                  DataColumn(label: Text('Customer')),
                  DataColumn(label: Text('Jumlah')),
                  DataColumn(label: Text('Total')),
                ],
                rows: salesController.sales.map((sale) {
                  return DataRow(cells: [
                    DataCell(Text(sale['noFaktur'])),
                    DataCell(
                        Text(DateFormat('dd/MM/yyyy').format(sale['tanggal']))),
                    DataCell(Text(sale['customer'])),
                    DataCell(Text(sale['jumlahBarang'].toString())),
                    DataCell(
                        Text(currencyFormat.format(sale['totalPenjualan']))),
                  ]);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
